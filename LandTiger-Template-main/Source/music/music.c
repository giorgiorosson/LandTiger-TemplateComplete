#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
    if(note.freq != pause)
    {
        reset_timer(0);
        init_timer(0, 0, 0, 3, note.freq);
        
        // --- MODIFICA PER SUONO PULITO (DAC) ---
        // Impostiamo P0.26 come AOUT (Analog Output) invece che GPIO
        // PINSEL1 [21:20] deve essere 10 (binario) -> 2 (decimale)
        LPC_PINCON->PINSEL1 &= ~(3 << 20); // Pulisce i bit
        LPC_PINCON->PINSEL1 |= (2 << 20);  // Imposta modalità DAC (AOUT)
        
        enable_timer(0);
    }
    reset_timer(1);
    init_timer(1, 0, 0, 3, note.duration);
    enable_timer(1);
}

BOOL isNotePlaying(void)
{
    return ((LPC_TIM0->TCR != 0) || (LPC_TIM1->TCR != 0));
}