#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
	if(note.freq != pause)
	{
		reset_timer(2);
		
		// Calcola i tick per il Timer 2 (Frequenza)
		// 25MHz / (Freq * 2)
		uint32_t ticks = 25000000 / (note.freq * 2);
		
		init_timer(2, 0, 0, 3, ticks);
		
		// Configura pin P0.26 come Analog Output (DAC)
		LPC_PINCON->PINSEL1 &= ~(3 << 20);
		LPC_PINCON->PINSEL1 |= (2 << 20);
		
		enable_timer(2);
	}
	
	// Imposta la durata su Timer 1
	reset_timer(1);
	init_timer(1, 0, 0, 3, note.duration);
	enable_timer(1);
}

BOOL isNotePlaying(void)
{
	return ((LPC_TIM2->TCR != 0) || (LPC_TIM1->TCR != 0));
}