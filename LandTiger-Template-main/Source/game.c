#include "game.h"
#include "LPC17xx.h"
#include <stdlib.h>
#include <stdio.h>
#include "music/music.h"
#include "timer/timer.h"

// Variabili Globali
uint16_t griglia[RIGHE_CAMPO][COLONNE_CAMPO];
Tetramino tetraminoCorrente;
Tetramino tetraminoSuccessivo;
volatile StatoGioco stato_gioco = GIOCO_IN_PAUSA;

int punteggio = 0;
int linee_completate_totali = 0; 
volatile int record_punteggio = 0; 
volatile int mod_caduta_rapida = 0; 
volatile int richiesta_riavvio = 0;

extern volatile int J_left;
extern volatile int J_right;
extern volatile int J_up;    
extern volatile int J_down;  

// --- SPARTITO TETRIS (Theme A - Korobeiniki) ---
NOTE tetris_theme[] = {
    // Parte A
    {e5, time_semiminima}, {b4, time_croma}, {c5, time_croma}, {d5, time_semiminima}, {c5, time_croma}, {b4, time_croma},
    {a4, time_semiminima}, {a4, time_croma}, {c5, time_croma}, {e5, time_semiminima}, {d5, time_croma}, {c5, time_croma},
    {b4, time_semiminima}, {b4, time_croma}, {c5, time_croma}, {d5, time_semiminima}, {e5, time_semiminima},
    {c5, time_semiminima}, {a4, time_semiminima}, {a4, time_semiminima},
    {pause, time_croma}, 
    
    // Parte B
    {d5, time_semiminima}, {f5, time_croma}, {a5, time_semiminima}, {g5, time_croma}, {f5, time_croma},
    {e5, time_semiminima}, {c5, time_croma}, {e5, time_semiminima}, {d5, time_croma}, {c5, time_croma},
    {b4, time_semiminima}, {b4, time_croma}, {c5, time_croma}, {d5, time_semiminima}, {e5, time_semiminima},
    {c5, time_semiminima}, {a4, time_semiminima}, {a4, time_semiminima},
    
    {pause, 0} // Fine brano
};
NOTE sfx_rotate = {a5, time_biscroma};
// Forme dei blocchi 
const Punto FORME_TETRAMINI[7][4] = {
    {{0, -1}, {0, 0}, {0, 1}, {0, 2}},  // I
    {{0, -1}, {0, 0}, {0, 1}, {1, 1}},  // J
    {{0, -1}, {0, 0}, {0, 1}, {1, -1}}, // L
    {{0, 0}, {0, 1}, {1, 0}, {1, 1}},   // O
    {{0, -1}, {0, 0}, {1, 0}, {1, 1}},  // S
    {{0, -1}, {0, 0}, {0, 1}, {1, 0}},  // T
    {{0, 1}, {0, 0}, {1, 0}, {1, -1}}   // Z
};

const uint16_t COLORI_TETRAMINI[7] = {
    C_Ciano, C_Blu, C_Arancio, C_Giallo, C_Verde, C_Magenta, C_Rosso
};

// --- Funzioni Grafiche ---
void disegna_cella_griglia(int riga, int colonna, uint16_t colore) {
    int x0 = OFFSET_X_GRIGLIA + (colonna * DIM_BLOCCO);
    int y0 = OFFSET_Y_GRIGLIA + (riga * DIM_BLOCCO);
    int i, j;
    for (i = 0; i < DIM_BLOCCO; i++) {
        for (j = 0; j < DIM_BLOCCO; j++) {
            if (i == DIM_BLOCCO - 1 || j == DIM_BLOCCO - 1) LCD_SetPoint(x0 + j, y0 + i, C_Nero); 
            else LCD_SetPoint(x0 + j, y0 + i, colore);   
        }
    }
}

void disegna_tetramino(Tetramino blocco, uint16_t colore) {
    int i;
    for(i = 0; i < 4; i++) {
        int r = blocco.posizione.riga + blocco.celle[i].riga;
        int c = blocco.posizione.colonna + blocco.celle[i].colonna;
        if(r >= 0 && r < RIGHE_CAMPO && c >= 0 && c < COLONNE_CAMPO) {
            disegna_cella_griglia(r, c, colore);
        }
    }
}

void disegna_griglia_statica(void) {
    int i;
    char str[15];
    int x_start = OFFSET_X_GRIGLIA - 1;
    int y_start = OFFSET_Y_GRIGLIA - 1;
    int width_px = COLONNE_CAMPO * DIM_BLOCCO + 2;
    int height_px = RIGHE_CAMPO * DIM_BLOCCO + 2;

    for(i = 0; i < width_px; i++) {
        LCD_SetPoint(x_start + i, y_start, C_Magenta);
        LCD_SetPoint(x_start + i, y_start + height_px, C_Magenta);
    }
    for(i = 0; i < height_px; i++) {
        LCD_SetPoint(x_start, y_start + i, C_Magenta);
        LCD_SetPoint(x_start + width_px, y_start + i, C_Magenta);
    }

    GUI_Text(160, 20, (uint8_t *) "SCORE", C_Magenta, C_Nero);
    sprintf(str, "%d", punteggio);
    GUI_Text(160, 40, (uint8_t *)str, C_Magenta, C_Nero);

    GUI_Text(160, 70, (uint8_t *) "LINES", C_Magenta, C_Nero);
    sprintf(str, "%d", linee_completate_totali);
    GUI_Text(160, 90, (uint8_t *)str, C_Magenta, C_Nero);
    
    GUI_Text(160, 170, (uint8_t *) "NEXT", C_Magenta, C_Nero);
}

void disegna_blocco_anteprima(Tetramino blk, uint16_t colore) {
    int start_x = 160;
    int start_y = 190;
    int i, a, b;
    for(i = 0; i < 4; i++) {
        int r = blk.celle[i].riga + 1; 
        int c = blk.celle[i].colonna + 1;
        int px = start_x + (c * DIM_BLOCCO);
        int py = start_y + (r * DIM_BLOCCO);
        for (a = 0; a < DIM_BLOCCO; a++) {
            for (b = 0; b < DIM_BLOCCO; b++) {
                if (a == DIM_BLOCCO - 1 || b == DIM_BLOCCO - 1) LCD_SetPoint(px + b, py + a, C_Nero); 
                else LCD_SetPoint(px + b, py + a, colore);   
            }
        }
    }
}

int controlla_collisione(Tetramino b) {
    int i;
    for(i = 0; i < 4; i++) {
        int r = b.posizione.riga + b.celle[i].riga;
        int c = b.posizione.colonna + b.celle[i].colonna;
        if (r >= RIGHE_CAMPO) return 1; 
        if (c < 0 || c >= COLONNE_CAMPO) return 1;
        if (r >= 0 && griglia[r][c] != C_Nero) return 1;
    }
    return 0;
}

void controlla_linee(void) {
    int row, col, k;
    int linee_cancellate = 0;
    char str[15];
    
    for(row = RIGHE_CAMPO - 1; row >= 0; row--) {
        int full = 1;
        for(col = 0; col < COLONNE_CAMPO; col++) {
            if(griglia[row][col] == C_Nero) { full = 0; break; }
        }
        if(full) {
            linee_cancellate++;
            for(k = row; k > 0; k--) {
                for(col = 0; col < COLONNE_CAMPO; col++) griglia[k][col] = griglia[k-1][col];
            }
            for(col = 0; col < COLONNE_CAMPO; col++) griglia[0][col] = C_Nero;
            row++; 
        }
    }
    
    if(linee_cancellate > 0) {
        linee_completate_totali += linee_cancellate;
        sprintf(str, "%d", linee_completate_totali);
        GUI_Text(160, 90, (uint8_t *)str, C_Bianco, C_Nero);
        punteggio += (linee_cancellate * 100); 
        sprintf(str, "%d", punteggio);
        GUI_Text(160, 40, (uint8_t *)str, C_Bianco, C_Nero);
        
        for(row=0; row<RIGHE_CAMPO; row++) {
             for(col=0; col<COLONNE_CAMPO; col++) disegna_cella_griglia(row, col, griglia[row][col]);
        }
    }
}

void genera_blocco(void) {
    int i;
    if (tetraminoCorrente.tipo == 0 && tetraminoSuccessivo.tipo == 0) {
        tetraminoSuccessivo.tipo = (TipoBlocco)(rand() % 7);
        tetraminoSuccessivo.colore = COLORI_TETRAMINI[tetraminoSuccessivo.tipo];
        tetraminoSuccessivo.rotazione = 0;
        for(i=0; i<4; i++) tetraminoSuccessivo.celle[i] = FORME_TETRAMINI[tetraminoSuccessivo.tipo][i];
    }
    tetraminoCorrente = tetraminoSuccessivo;
    tetraminoCorrente.posizione.riga = 1; 
    tetraminoCorrente.posizione.colonna = COLONNE_CAMPO / 2;
    disegna_blocco_anteprima(tetraminoCorrente, C_Nero);

    tetraminoSuccessivo.tipo = (TipoBlocco)(rand() % 7);
    tetraminoSuccessivo.colore = COLORI_TETRAMINI[tetraminoSuccessivo.tipo];
    tetraminoSuccessivo.rotazione = 0;
    for(i=0; i<4; i++) tetraminoSuccessivo.celle[i] = FORME_TETRAMINI[tetraminoSuccessivo.tipo][i];
    disegna_blocco_anteprima(tetraminoSuccessivo, tetraminoSuccessivo.colore);
}

// Funzione per inizializzare l'ADC (Potenziometro)
void ADC_init(void) {
    // 1. Configura il pin P1.31 per la funzione AD0.5
    LPC_PINCON->PINSEL3 |= (3 << 30); 

    // 2. Accendi l'alimentazione per l'ADC (Bit 12 di PCONP)
    LPC_SC->PCONP |= (1 << 12);       

    // 3. Configura il registro di controllo ADC (ADCR)
    LPC_ADC->ADCR = (1 << 5) |      // Seleziona il canale 5 (AD0.5)
                    (4 << 8) |      // Clock divider: 25MHz / (4+1) = 5MHz (deve essere <= 13MHz)
                    (1 << 21);      // PDN = 1: ADC operativo
}

// --- INITIALIZZAZIONE ---
void inizializza_gioco(void) {
    int i, j;
    
    // Configura Timer 2 (Audio) alta priorità, Timer 0 (Gioco) bassa
    NVIC_SetPriority(TIMER2_IRQn, 0); 
    NVIC_SetPriority(TIMER1_IRQn, 1);
    NVIC_SetPriority(RIT_IRQn, 2);    
    NVIC_SetPriority(TIMER0_IRQn, 3); 
    
    for(i = 0; i < RIGHE_CAMPO; i++) for(j = 0; j < COLONNE_CAMPO; j++) griglia[i][j] = C_Nero;
    
    punteggio = 0; 
    linee_completate_totali = 0;
    stato_gioco = GIOCO_IN_PAUSA;
    tetraminoCorrente.tipo = 0;
    tetraminoSuccessivo.tipo = 0;
    
    LCD_Clear(C_Nero);
    disegna_griglia_statica(); 
    genera_blocco();

    // Inizializza l'ADC (Potenziometro)
    // Assicurati di aver definito la funzione ADC_init() nel file o incluso l'header
    ADC_init();

    // 1. Accendi Timer 2 per la musica (PCONP bit 22)
    LPC_SC->PCONP |= (1 << 22); 
    
    // 2. Init Timer 0 per il GIOCO (60Hz circa)
    init_timer(0, 0, 0, 3, 0x65B9A); 
    enable_timer(0);
    
    // 3. Fai partire la musica (usa Timer 2 per freq, Timer 1 per durata)
    playNote(tetris_theme[0]);
}

void blocca_blocco(void) {
    int i;
    char str[15];
    for(i = 0; i < 4; i++) {
        int r = tetraminoCorrente.posizione.riga + tetraminoCorrente.celle[i].riga;
        int c = tetraminoCorrente.posizione.colonna + tetraminoCorrente.celle[i].colonna;
        if(r >= 0 && r < RIGHE_CAMPO && c >= 0 && c < COLONNE_CAMPO) griglia[r][c] = tetraminoCorrente.colore;
    }
    punteggio += 10;
    sprintf(str, "%d", punteggio);
    GUI_Text(160, 40, (uint8_t *)str, C_Bianco, C_Nero);
    mod_caduta_rapida = 0; 
    controlla_linee(); 
    genera_blocco();
    disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
    
    if (controlla_collisione(tetraminoCorrente)) {
        stato_gioco = GIOCO_FINITO;
        GUI_Text(50, 150, (uint8_t *)"GAME OVER", C_Rosso, C_Bianco);
        GUI_Text(30, 190, (uint8_t *)"PRESS KEY1", C_Bianco, C_Nero);
    }
}

void ruota_blocco(void) {
    Tetramino temp = tetraminoCorrente;
    int i;
    if (temp.tipo == BLOCCO_O) return;
    for(i = 0; i < 4; i++) {
        int oldRow = temp.celle[i].riga;
        int oldCol = temp.celle[i].colonna;
        temp.celle[i].riga = oldCol;
        temp.celle[i].colonna = -oldRow;
    }
    temp.rotazione = (temp.rotazione + 1) % 4;
    
    // Se la rotazione è valida (non sbatte contro muri o blocchi)
    if (controlla_collisione(temp) == 0) {
        disegna_tetramino(tetraminoCorrente, C_Nero);
        tetraminoCorrente = temp;
        disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        
        // >>> AGGIUNGI QUESTA RIGA PER IL SUONO <<<
        playNote(sfx_rotate); 
    }
}

static int ticks = 0;

void aggiorna_gioco(void) {
    Tetramino temp;
    
    if (richiesta_riavvio) {
        richiesta_riavvio = 0;
        inizializza_gioco();
        return;
    }
    if (stato_gioco != GIOCO_IN_CORSO) return;

    if (mod_caduta_rapida == 1) {
        disegna_tetramino(tetraminoCorrente, C_Nero);
        while (controlla_collisione(tetraminoCorrente) == 0) tetraminoCorrente.posizione.riga++;
        tetraminoCorrente.posizione.riga--; 
        disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        blocca_blocco();
        return; 
    }

    if (J_up != 0) { ruota_blocco(); J_up = 0; }
    if (J_left != 0) {
        temp = tetraminoCorrente;
        temp.posizione.colonna--; 
        if (controlla_collisione(temp) == 0) {
            disegna_tetramino(tetraminoCorrente, C_Nero);
            tetraminoCorrente = temp;
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        }
        J_left = 0; 
    }
    if (J_right != 0) {
        temp = tetraminoCorrente;
        temp.posizione.colonna++; 
        if (controlla_collisione(temp) == 0) {
            disegna_tetramino(tetraminoCorrente, C_Nero);
            tetraminoCorrente = temp;
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
        }
        J_right = 0; 
    }

    // --- LOGICA VELOCITA' (SPECIFICA 1) ---
    
    // 1. Avvia conversione ADC
    LPC_ADC->ADCR |= (1 << 24); 
    
    // 2. Attendi la fine della conversione
    while (!(LPC_ADC->ADGDR & (1U << 31)));
    
    // 3. Leggi il risultato (Bit 4-15)
    int adc_val = (LPC_ADC->ADGDR >> 4) & 0xFFF;
    
    // 4. Mappa il valore ADC (0-4095) in velocità (1-5 blocchi/secondo)
    // Formula: Speed = 1 + (ValoreADC / 4095) * 4
    float speed = 1.0f + ((float)adc_val * 4.0f) / 4095.0f;
    
    // 5. Gestione Soft Drop (Joystick Giù)
    // "holding the joystick down doubles the current falling speed"
    if (J_down != 0) {
        speed *= 2.0f; 
    }
    
    // 6. Calcolo Threshold (Tick necessari per muovere il blocco)
    // Il Timer 0 gira a 60Hz. Threshold = FrequenzaTimer / BlocchiPerSecondo
    int threshold = (int)(60.0f / speed);
    
    // Sicurezza: il threshold non deve mai essere < 1
    if (threshold < 1) threshold = 1;

    ticks++;
    
    if (ticks >= threshold) { 
        ticks = 0; 
        temp = tetraminoCorrente;
        temp.posizione.riga++;
        if (controlla_collisione(temp)) {
            blocca_blocco();
        } else {
            disegna_tetramino(tetraminoCorrente, C_Nero); 
            tetraminoCorrente.posizione.riga++;            
            disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore); 
        }
    } 
}

void alla_pressione_tasto1(void) {
    srand(LPC_TIM0->TC); 
    if (stato_gioco == GIOCO_FINITO) { richiesta_riavvio = 1; return; }
    if (stato_gioco == GIOCO_IN_PAUSA) {
        stato_gioco = GIOCO_IN_CORSO;
        GUI_Text(160, 265, (uint8_t *) "      ", C_Nero, C_Nero); 
    } 
    else if (stato_gioco == GIOCO_IN_CORSO) {
        stato_gioco = GIOCO_IN_PAUSA;
        GUI_Text(160, 265, (uint8_t *) "PAUSED", C_Giallo, C_Nero);
    }
}