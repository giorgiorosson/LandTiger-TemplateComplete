#include "music.h"
#include "LPC17xx.h"
#include "../timer/timer.h"

void playNote(NOTE note)
{
    if(note.freq != pause)
    {
        reset_timer(0);
        
        // --- CORREZIONE MATEMATICA CRITICA ---
        // Il clock è 25MHz.
        // Esempio: 440Hz -> il timer deve contare 28.409 cicli, non 440!
        // Senza questa formula, il processore si blocca per i troppi interrupt.
        uint32_t ticks = 25000000 / (note.freq * 2);
        
        init_timer(0, 0, 0, 3, ticks);
        
        // Configura P0.26 come uscita Analogica (DAC) per il suono pulito
        LPC_PINCON->PINSEL1 &= ~(3 << 20); // Pulisce
        LPC_PINCON->PINSEL1 |= (2 << 20);  // Imposta AOUT
        
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