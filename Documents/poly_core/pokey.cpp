#include <iostream>

uint32_t m_poly4[0x0f];
uint32_t m_poly5[0x1f];
uint32_t m_poly9[0x1ff];
uint32_t m_poly17[0x1ffff];

void poly_init_4_5(uint32_t* poly, int size, int xorbit, int invert)
{
	int mask = (1 << size) - 1;
	int i;
	uint32_t lfsr = 0;

	//LOG_POLY(("poly %d\n", size));
	for (i = 0; i < mask; i++)
	{
		// calculate next bit 
		int in = !((lfsr >> 0) & 1) ^ ((lfsr >> xorbit) & 1);
		lfsr = lfsr >> 1;
		lfsr = (in << (size - 1)) | lfsr;
		*poly = lfsr ^ invert;
		
		if (*poly & 0x1)
		{
			std::cout << "1 ";
		}
		else
		{
			std::cout << "0 ";
		}
		
		poly++;
	}
	std::cout << "\n";
}

void poly_init_9_17(uint32_t* poly, int size)
{
	int mask = (1 << size) - 1;
	int i;
	uint32_t lfsr = mask;
	int count = 0;

	if (size == 17)
	{
		for (i = 0; i < mask; i++)
		{
			//calculate next bit @ 7
			int in8 = ((lfsr >> 8) & 1) ^ ((lfsr >> 13) & 1);
			int in = (lfsr & 1);
			lfsr = lfsr >> 1;
			lfsr = (lfsr & 0xff7f) | (in8 << 7);
			lfsr = (in << 16) | lfsr;
			*poly = lfsr;
			
			if (count < 300)
			{
				std::cout << ((*poly >> 8) & 0xff) << " ";
				count++;
			}
			
			poly++;
		}
	}
	else
	{
		for (i = 0; i < mask; i++)
		{
			// calculate next bit 
			int in = ((lfsr >> 0) & 1) ^ ((lfsr >> 5) & 1);
			lfsr = lfsr >> 1;
			lfsr = (in << 8) | lfsr;
			*poly = lfsr;
			
			std::cout << (*poly & 0xff) << " ";

			poly++;
		}
		std::cout << "\n";
	}
}

int main()
{
	/* initialize the poly counters */
	std::cout << "\n4-bit poly:\n";
	poly_init_4_5(m_poly4, 4, 1, 0);
	std::cout << "\n5-bit poly:\n";
	poly_init_4_5(m_poly5, 5, 2, 1);

	/* initialize 9 / 17 arrays */
	std::cout << "\n9-bit poly:\n";
	poly_init_9_17(m_poly9, 9);
	std::cout << "\n17-bit poly:\n";
	poly_init_9_17(m_poly17, 17);
}



