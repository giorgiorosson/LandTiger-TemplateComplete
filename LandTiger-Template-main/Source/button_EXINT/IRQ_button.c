#include "button.h"
#include "LPC17xx.h"


#include "../led/led.h"
#include "../timer/timer.h"


// Variabili Globali Gestione De-Bouncing 
	
extern int down_0;
extern int down_1;
extern int down_2;


void EINT0_IRQHandler (void)	  	// INT0
{		
	down_0 = 1;
	NVIC_DisableIRQ(EINT0_IRQn);						
	LPC_PINCON->PINSEL4    &= ~(1 << 20);     				
	
	LPC_SC->EXTINT &= (1 << 0);     					
}


void EINT1_IRQHandler (void)	  	// KEY1	
{
	down_1 = 1;
	NVIC_DisableIRQ(EINT1_IRQn);						
	LPC_PINCON->PINSEL4    &= ~(1 << 22);     				
	
	LPC_SC->EXTINT &= (1 << 1);     					
}

void EINT2_IRQHandler (void)	  	// KEY2
{
	down_2 = 1;
	NVIC_DisableIRQ(EINT2_IRQn);							
	LPC_PINCON->PINSEL4    &= ~(1 << 24);    	 			
	
	LPC_SC->EXTINT &= (1 << 2);     					    
}
