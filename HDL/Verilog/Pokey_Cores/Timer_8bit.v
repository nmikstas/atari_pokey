`timescale 1ns / 10ps

//*******************************************8 Bit Timer*******************************************

module timer_8bit
(
    input  enn,
    input  clk,
    input  [7:0]d,
    input  wr,
    input  ld,
    input  cr,
    output nBor
);
    reg [7:0]dInt;
    reg [3:0]lCount;
    reg [3:0]hCount;
    reg lBor, hBor;

    always@(negedge(clk) && enn == 1'b1) begin
        //Zero out borrow bits and reload counter
        if(ld == 1'b1) begin
            lBor   <= 1'b0;
            hBor   <= 1'b0;
            lCount <= dInt[3:0];
            hCount <= dInt[7:4];
        end
        
        //counter is active if load is low.
        else if(ld == 1'b0) begin
            lBor <= cr;
                
            if(lCount == 4'b0000 && lBor == 1'b1) begin
                hBor <= 1'b1;
            end
            
            else begin
                hBor <= 1'b0;
            end
            
            //Decrement counter.
            lCount <= lCount - lBor;
            hCount <= hCount - hBor;
        end
                   
        //Load in counter value from external data register.
        if(wr == 1'b1) begin
            dInt <= d;
        end
    end
    
    //Update output borrow.
    assign nBor = (hBor == 1'b1 && hCount == 4'b0000 && ld == 1'b0) ? 1'b0 : 1'b1;
endmodule
