#include "game.h"
#include "LPC17xx.h" 
#include <stdlib.h>
#include <stdio.h> 
#include "music/music.h" // Necessario per playNote e struct NOTE
#include "timer/timer.h" // Necessario per init_timer e enable_timer

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

// Variabili Esterne
extern volatile int J_left;
extern volatile int J_right;
extern volatile int J_up;    
extern volatile int J_down;  

//  SPARTITO MUSICALE TETRIS 
NOTE tetris_theme[] = {
    // Parte 1
    {e4, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima}, 
    {c4, time_croma}, {b3, time_croma}, {a3, time_semiminima}, {a3, time_croma}, 
    {c4, time_croma}, {e4, time_semiminima}, {d4, time_croma}, {c4, time_croma},
    {b3, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima}, 
    {e4, time_semiminima}, {c4, time_semiminima}, {a3, time_semiminima}, {a3, time_semiminima},
    {pause, time_croma}, // Pausa breve
    
    // Parte 2
    {d4, time_semiminima}, {f4, time_croma}, {a4, time_semiminima}, {g4, time_croma}, {f4, time_croma},
    {e4, time_semiminima}, {c4, time_croma}, {e4, time_semiminima}, {d4, time_croma}, {c4, time_croma},
    {b3, time_semiminima}, {b3, time_croma}, {c4, time_croma}, {d4, time_semiminima}, {e4, time_semiminima},
    {c4, time_semiminima}, {a3, time_semiminima}, {a3, time_semiminima},
    
    {pause, 0} //  Indica la fine della canzone (loop)
};

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

// --- Funzioni di Disegno (Invariate) ---

void disegna_cella_griglia(int riga, int colonna, uint16_t colore) {
    int x0 = OFFSET_X_GRIGLIA + (colonna * DIM_BLOCCO);
    int y0 = OFFSET_Y_GRIGLIA + (riga * DIM_BLOCCO);
    int i, j;
    for (i = 0; i < DIM_BLOCCO; i++) {
        for (j = 0; j < DIM_BLOCCO; j++) {
            if (i == DIM_BLOCCO - 1 || j == DIM_BLOCCO - 1)
                LCD_SetPoint(x0 + j, y0 + i, C_Nero); 
            else
                LCD_SetPoint(x0 + j, y0 + i, colore);   
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

    GUI_Text(160, 120, (uint8_t *) "HI-SCORE", C_Magenta, C_Nero);
    sprintf(str, "%d", record_punteggio);
    GUI_Text(160, 140, (uint8_t *)str, C_Giallo, C_Nero);
    
    GUI_Text(160, 170, (uint8_t *) "NEXT", C_Magenta, C_Nero);
    
    if (stato_gioco == GIOCO_IN_PAUSA) {
        GUI_Text(160, 265, (uint8_t *) "PAUSED", C_Giallo, C_Nero);
    }
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
                if (a == DIM_BLOCCO - 1 || b == DIM_BLOCCO - 1)
                    LCD_SetPoint(px + b, py + a, C_Nero); 
                else
                    LCD_SetPoint(px + b, py + a, colore);   
            }
        }
    }
}

// --- Logica di Gioco ---

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
            if(griglia[row][col] == C_Nero) {
                full = 0; break;
            }
        }
        
        if(full) {
            linee_cancellate++;
            for(k = row; k > 0; k--) {
                for(col = 0; col < COLONNE_CAMPO; col++) {
                    griglia[k][col] = griglia[k-1][col];
                }
            }
            for(col = 0; col < COLONNE_CAMPO; col++) {
                griglia[0][col] = C_Nero;
            }
            row++; 
        }
    }
    
    if(linee_cancellate > 0) {
        linee_completate_totali += linee_cancellate;
        sprintf(str, "%d", linee_completate_totali);
        GUI_Text(160, 90, (uint8_t *)str, C_Bianco, C_Nero);

        if (linee_cancellate == 4) punteggio += 600; 
        else punteggio += (linee_cancellate * 100); 
        
        sprintf(str, "%d", punteggio);
        GUI_Text(160, 40, (uint8_t *)str, C_Bianco, C_Nero);
        
        for(row=0; row<RIGHE_CAMPO; row++) {
             for(col=0; col<COLONNE_CAMPO; col++) {
                 disegna_cella_griglia(row, col, griglia[row][col]);
             }
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

void alla_pressione_tasto1(void) {
    srand(LPC_TIM0->TC); // Seed random usando il timer
    if (stato_gioco == GIOCO_FINITO) {
        richiesta_riavvio = 1;
        return;
    }
    if (stato_gioco == GIOCO_IN_PAUSA) {
        stato_gioco = GIOCO_IN_CORSO;
        GUI_Text(160, 265, (uint8_t *) "      ", C_Nero, C_Nero); 
    } 
    else if (stato_gioco == GIOCO_IN_CORSO) {
        stato_gioco = GIOCO_IN_PAUSA;
        GUI_Text(160, 265, (uint8_t *) "PAUSED", C_Giallo, C_Nero);
    }
}

// ... (codice precedente invariato) ...

void inizializza_gioco(void) {
    int i, j;
    
    // Configura le priorità: Musica (T0/T1) alta, Gioco (T2) bassa
    NVIC_SetPriority(TIMER0_IRQn, 0); // Musica Freq (Alta priorità)
    NVIC_SetPriority(TIMER1_IRQn, 1); // Musica Durata
    NVIC_SetPriority(RIT_IRQn, 2);    // Joystick
    NVIC_SetPriority(TIMER2_IRQn, 3); // Gioco (Bassa priorità)
    
    for(i = 0; i < RIGHE_CAMPO; i++) {
        for(j = 0; j < COLONNE_CAMPO; j++) {
            griglia[i][j] = C_Nero;
        }
    }
    
    punteggio = 0; 
    linee_completate_totali = 0;
    stato_gioco = GIOCO_IN_PAUSA;
    
    tetraminoCorrente.tipo = 0;
    tetraminoSuccessivo.tipo = 0;
    
    LCD_Clear(C_Nero);
    disegna_griglia_statica(); 
    genera_blocco();

    // --- PARTE MANCANTE FONDAMENTALE ---
    
    // 1. Accendi elettricamente il Timer 2 (altrimenti non parte!)
    // Nota: power_on_timer2() è in lib_timer.c, se non la vede usa la riga sotto:
    LPC_SC->PCONP |= (1 << 22); 

    // 2. Inizializza Timer 2: TimerNum=2, Prescaler=0, Match=0, Config=3, Valore=0x65B9A
    // 0x65B9A corrisponde a circa 60Hz (velocità di gioco fluida)
    init_timer(2, 0, 0, 3, 0x65B9A); 
    
    // 3. Avvia il Timer 2
    enable_timer(2);
    
    // Se vuoi la musica, scommenta questa riga (DOPO aver fixato music.c)
    // playNote(tetris_theme[0]); 
}

// ... (resto del file invariato) ...
void blocca_blocco(void) {
    int i;
    char str[15];
    for(i = 0; i < 4; i++) {
        int r = tetraminoCorrente.posizione.riga + tetraminoCorrente.celle[i].riga;
        int c = tetraminoCorrente.posizione.colonna + tetraminoCorrente.celle[i].colonna;
        if(r >= 0 && r < RIGHE_CAMPO && c >= 0 && c < COLONNE_CAMPO) {
            griglia[r][c] = tetraminoCorrente.colore;
        }
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
        if (punteggio > record_punteggio) {
            record_punteggio = punteggio;
            sprintf(str, "%d", record_punteggio);
            GUI_Text(160, 140, (uint8_t *)str, C_Giallo, C_Nero);
            GUI_Text(50, 170, (uint8_t *)"NEW RECORD!", C_Giallo, C_Nero);
        }
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
    if (controlla_collisione(temp) == 0) {
        disegna_tetramino(tetraminoCorrente, C_Nero);
        tetraminoCorrente = temp;
        disegna_tetramino(tetraminoCorrente, tetraminoCorrente.colore);
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
        while (controlla_collisione(tetraminoCorrente) == 0) {
            tetraminoCorrente.posizione.riga++;
        }
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

    ticks++;
    // Qui si potrebbe usare il potenziometro per la velocità
    int threshold = 40; 
    if (J_down != 0) threshold = 2; 
    
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