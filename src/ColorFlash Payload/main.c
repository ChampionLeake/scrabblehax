#define GREEN 0x0000FF00L 
#define BLUE 0x00FF0000L

typedef unsigned int u32;

void FillVRAM(u32 color)
{
	int i;

	for(i = 0x44000000; i < 0x44100000; i += 4)
	{
		(((u32 *)i)[0]) = color;
	}
}


void _start() __attribute__ ((section (".text.start")));
void _start()
{
   FillVRAM(BLUE);   
   FillVRAM(GREEN);  
}