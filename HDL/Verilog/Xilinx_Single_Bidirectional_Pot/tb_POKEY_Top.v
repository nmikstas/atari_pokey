`timescale 1ns / 1ps

module tb_POKEY_Top;
    localparam c_12  = 83.33333333 / 2; //12MHz half cycle.
    localparam c_179 = 558.7247666 / 2; //1.79MHz half cycle.
    
    localparam TRUE  = 1'b1;
    localparam FALSE = 1'b0;
    
    //Write addresses.
    localparam AUDF1  = 4'h0;
    localparam AUDC1  = 4'h1;
    localparam AUDF2  = 4'h2;
    localparam AUDC2  = 4'h3;
    localparam AUDF3  = 4'h4;
    localparam AUDC3  = 4'h5;
    localparam AUDF4  = 4'h6;
    localparam AUDC4  = 4'h7;
    localparam AUDCTL = 4'h8;
    localparam STIMER = 4'h9;
    localparam SKRES  = 4'hA;
    localparam POTGO  = 4'hB;
    localparam SEROUT = 4'hD;
    localparam IRQEN  = 4'hE;
    localparam SKCTLS = 4'hF;
    
    //Read addresses.
    localparam POT0   = 4'h0;
    localparam POT1   = 4'h1;
    localparam POT2   = 4'h2;
    localparam POT3   = 4'h3;
    localparam POT4   = 4'h4;
    localparam POT5   = 4'h5;
    localparam POT6   = 4'h6;
    localparam POT7   = 4'h7;
    localparam ALLPOT = 4'h8;
    localparam KBCODE = 4'h9;
    localparam RANDOM = 4'hA;
    localparam SERIN  = 4'hD;
    localparam IRQST  = 4'hE;
    localparam SKSTAT = 4'hF;
    
    localparam ZEROES = 8'b00000000;
    localparam ONES   = 8'b11111111;
    
    //Top signals.
    //reg sysclk = 1'b0;
    //reg clk179 = 1'b0;
    reg clk = 1'b0;
    reg [1:0]cs = 2'b00;
    reg rw = 1'b1;
    wire [7:0]d = 8'bzzzzzzzz;
    reg [3:0]a = 4'bzzzz;
    reg [7:0]p = 8'b11111111;
    reg [2:1]kr = 2'b11;
    reg sid = 1'b0;
    reg bclki = 1'b0;
    wire irq;   
    wire [5:0]audio;
    wire dump;
    wire [5:0]k;
    wire bclko;
    wire sod;
    wire oclk;
    wire OE;
    
    //Data signals.
    reg  [7:0]din = 8'bzzzzzzzz;
    wire [7:0]dout;
    
    //Keyboard core test register.
    reg [5:0]keycode = 6'b000000;
    
    //POKEY_Top _pokey_top(sysclk, clk179, cs, rw, irq, d, a, audio, p, dump,
    //                     k, kr, sid, bclki, bclko, sod, oclk);
    POKEY_Top _pokey_top(clk, cs, rw, irq, d, a, audio, p, dump,
                         k, kr, sid, bclki, bclko, sod, oclk);

    //always #c_12  sysclk = !sysclk; //12MHz clock generator.
    //always #c_179 clk179 = !clk179; //1.512MHz clock generator.
    always #c_179 clk = !clk; //1.512MHz clock generator.
    
    //Bidirectional data port assignments.
    assign d = (rw == 1'b0) ? din : 8'bzzzzzzzz;
    assign dout = d;
    
    //Write task. First parameter is the address, second is the data.
    task automatic write(input [3:0]addr, input [7:0]data);
    begin
        //@(negedge clk179)
        @(negedge clk)
        #150
        rw = 1'b0;
        a  = addr;
        #80
        cs = 2'b10;
        //@(posedge clk179)
        @(posedge clk)
        #30
        a = 4'bzzzz;
        #120
        din = data;
        //@(negedge clk179);
        @(negedge clk)
        #10
        din = 8'bzzzzzzzz;
        #20
        rw = 1'b1;
        cs = 2'b00;
    end
    endtask
    
    //Read task. Input parameter is address to read.
    task automatic read(input [3:0]addr);
    begin
        //@(negedge clk179)
        @(negedge clk)
        #150
        rw = 1'b1;
        a  = addr;
        #80
        cs = 2'b10;
        //@(posedge clk179)
        @(posedge clk)
        #30
        a = 4'bzzzz;
        //@(negedge clk179)
        @(negedge clk)
        #30
        rw = 1'b1;
        cs = 2'b00;
    end
    endtask
    
    //Strobe init and release it.
    task automatic init();
    begin
        write(SKCTLS, ZEROES);
        #9000;
        write(SKCTLS, 8'b00000011);
    end
    endtask
    
    //Perform complete test on the POT core.
    task automatic pot_test();
    begin
        //Slow scan test.
        p = ONES;
        write(SKCTLS, 8'b00000011);
        write(POTGO,  ZEROES); //Write POTGO
        #1000; //Wait for POT core counter to be a known value.         
        #1500000 p[5] = 1'b0;
        #700000  p[4] = 1'b0;
        #2500000 p[0] = 1'b0;
        #2000000 p[7] = 1'b0;
        #1000 read(ALLPOT); //Read ALLPOT
        #1500000 p[2] = 1'b0;
        #3000000 p[6] = 1'b0;
        #2700000 p[1] = 1'b0; 
         
        @(dump == 1'b1)
        read(POT0); //Read POT0
        read(POT1); //Read POT1
        read(POT2); //Read POT2
        read(POT3); //Read POT3
        read(POT4); //Read POT4
        read(POT5); //Read POT5
        read(POT6); //Read POT6
        read(POT7); //Read POT7
    
        //Fast scan test.
        p = ONES;
        write(SKCTLS, 8'b00000111);
        write(POTGO,  ZEROES); //Write POTGO
        @(negedge _pokey_top.enn);
        @(negedge _pokey_top.enn);
        #15000 @(negedge _pokey_top.enn) p[3] = 1'b0;
        #5000  @(negedge _pokey_top.enn) p[0] = 1'b0;
        #7000  @(negedge _pokey_top.enn) p[1] = 1'b0;
        #3000  @(negedge _pokey_top.enn) p[2] = 1'b0;
        #2500  @(negedge _pokey_top.enn) p[6] = 1'b0;
        #5500  @(negedge _pokey_top.enn) p[4] = 1'b0;
        #15500 @(negedge _pokey_top.enn) p[7] = 1'b0;

        @(_pokey_top._pot_core.nQ == 8'd228)
        #1000;
        read(POT0); //Read POT0
        read(POT1); //Read POT1
        read(POT2); //Read POT2
        read(POT3); //Read POT3
        read(POT4); //Read POT4
        read(POT5); //Read POT5
        read(POT6); //Read POT6
        read(POT7); //Read POT7
    end
    endtask
    
    //Perform complete test on the clock gen core.
    task automatic clock_gen_test();
    begin
        write(AUDCTL, ZEROES);
        #1000000;
        write(AUDCTL, 8'd1);
        #1000000;
    end
    endtask
    
    task automatic poly_core_test();
    begin
        write(AUDCTL, 8'b10000000); //9 bit polynomial.
        init(); //Start at beginning to verify sequence.
        #10000 read(RANDOM);
        #2000  read(RANDOM);
        #4000  read(RANDOM);
        #8000  read(RANDOM);
        write(AUDCTL, 8'b00000000); //17 bit polynomial.
        init(); //Start at beginning to verify sequence.
        #10000 read(RANDOM);
        #2000  read(RANDOM);
        #4000  read(RANDOM);
        #8000  read(RANDOM);
    end
    endtask
    
    task automatic key_press(input [5:0]code, input setControl, input setShift, input setDebounce);
    begin
        //Make sure debounce is enabled.
        if(setDebounce == TRUE) begin
            write(SKCTLS, 8'b00000011);
        end    
        else begin
            write(SKCTLS, 8'b00000010);
        end
        
        keycode = code;
        kr = 2'b11;
        
        while(_pokey_top._key_core.keyDown == 1'b0) begin
            if(k == keycode) begin
                #1 kr[1] = 1'b0;
            end
            else begin
                #1 kr[1] = 1'b1;
            end
            
            //Set shift key pressed bit.
            if(setShift == TRUE && setControl == FALSE) begin
                if(k == 6'b101111) begin
                    #1 kr[2] = 1'b0;
                end
                else begin
                    #1 kr[2] = 1'b1;
                end
            end 
            
            //Set control key pressed bit.
            if(setControl == TRUE && setShift == FALSE) begin
                if(k == 6'b111111) begin
                    #1 kr[2] = 1'b0;
                end
                else begin
                    #1 kr[2] = 1'b1;
                end
            end
            
            //SET both.
            if(setControl == TRUE && setShift == TRUE) begin
                if(k == 6'b111111 || k == 6'b101111) begin
                    #1 kr[2] = 1'b0;
                end
                else begin
                    #1 kr[2] = 1'b1;
                end
            end       
        end
    
        //Wait for state machine to go back to waiting state.
        kr[1] = 1'b1;
        @(_pokey_top._key_core.keyDown == 1'b0);  
    end
    endtask
    
    //Test the debounceed key press with or without overrun.
    task automatic multi_press_test(input [5:0]code1, input [5:0]code2, input setOverrun, input setDebounce);
    begin
        #1200000; //Wait for break status to become known.
        write(IRQEN, ZEROES); //Clear any existing interrupts.
        write(IRQEN, 8'b11000000); //Enable keyboard interrupts.
        key_press(code1, TRUE, FALSE, setDebounce); //Press a key with debaounce enabled.
        
        if(setOverrun == FALSE) begin
            #100000;
            write(IRQEN, ZEROES); //Ack interrupt.
            write(IRQEN, 8'b11000000); //Enable again.
            #100000;
        end
        
        key_press(code2, FALSE, TRUE, setDebounce); //Press a key with debaounce enabled.
        read(KBCODE); //Read keyboard code.
        read(IRQST); //Read IRQ status
        write(IRQEN, ZEROES); //Reset IRQ.
        read(SKSTAT); //Read SKSTAT.
        write(SKRES, ZEROES);//Reset SKSTAT.
    end
    endtask
    
    //Set keyboard break signal.
    task automatic setBreak();
    begin
        #1200000; //Wait for break status to become known.
        write(IRQEN, ZEROES); //Clear any existing interrupts.
        write(IRQEN, 8'b11000000); //Enable keyboard interrupts.
        @(k == 6'b001111)
        kr[2] = 1'b0;
        @(k != 6'b001111) //Break pressed.
        kr[2] = 1'b1;
        read(IRQST); //Read IRQ status
        write(IRQEN, ZEROES); //Reset IRQ.
    end
    endtask
    
    task automatic slow_timer_test();
    begin
        write (AUDCTL, ZEROES); //Set all 4 channels to 8-bit timers, all slow clocks, 64KHz audio clock.
        write(AUDF1, 8'd25); //Load timer 1. 1229Hz at 64KHz aud clock, 302Hz at 15KHz aud clock.
        write(AUDF2, 8'd63); //Load timer 2.
        write(AUDF3, 8'd105); //Load timer 3.
        write(AUDF4, 8'd209); //Load timer 4.
        write(STIMER, ZEROES); //Start timers.
        write(IRQEN, ZEROES); //Clear any existing interrupts.
        write(IRQEN, 8'b00000111); //Enable Timer interrupts.
        @(irq == 1'b1) read(IRQST); //Read IRQ status
        #10000 write(IRQEN, 8'b00000110); //Clear Timer 1 IRQ.
        #10000 @(irq == 1'b1) read(IRQST); //Read IRQ status
        #10000 write(IRQEN, 8'b00000100); //Clear Timer 2 IRQ.
        #10000 @(irq == 1'b1) read(IRQST); //Read IRQ status
        #10000 write(IRQEN, 8'b00000000); //Clear Timer 4 IRQ.
        #7000000;
        write(AUDCTL, 8'b00000001); //Switch to 15KHz audio clock.
        #12000000;    
    end
    endtask
    
    task automatic fast_timer_test();
    begin   
        write (AUDCTL, 8'b01111000); //16-bit timers, fast clock.
        write(AUDF1, 8'd25); //Load timer 1.
        write(AUDF2, 8'd10); //Load timer 2.
        write(AUDF3, 8'd105); //Load timer 3.
        write(AUDF4, 8'd22); //Load timer 4. 155.8Hz at 1.79MHz clock.
        write(STIMER, ZEROES); //Start timers.
        #10000000;
    end
    endtask
    
    
    
    
    initial begin
    //----------------------------------------------------------------------------------------------
    #50000 //Wait for MMCM to start.
    write(AUDCTL, ZEROES); //Set AUDCTL register to known values.
    write(IRQEN, ZEROES); //Disable all interrupts.
    init(); //Init strobe.
    write(SKRES, ZEROES); //Set the SKSTAT latches into a known state.
    
    //pot_test(); //Test the POT core.
    //clock_gen_test(); //Test the clock gen core.
    //poly_core_test(); //Test the polynomial core.
    //multi_press_test(6'b001100, 6'b101100, FALSE, TRUE); //Key presses no overrun, debounce.
    //multi_press_test(6'b001100, 6'b101100, TRUE, TRUE); //Key presses overrun, debounce.
    //multi_press_test(6'b001100, 6'b101100, FALSE, FALSE); //Key presses no overrun, no debounce.
    //multi_press_test(6'b001100, 6'b101100, TRUE, FALSE); //Key presses overrun, no debounce.
    //setBreak(); //Set keyboard break signal.
    //slow_timer_test(); //Timers running on aud clock.
    //fast_timer_test(); //Timers running on MHz clock.
    
    
    
    #100000
    $stop;
    //----------------------------------------------------------------------------------------------
    end
endmodule
