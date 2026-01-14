# 1 "Source/music/music.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 404 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "Source/music/music.c" 2
# 1 "Source/music\\music.h" 1




//Default: 1.65







typedef char BOOL;



typedef enum note_durations
{
 time_semibiscroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 64.0f + 0.5), // 1/128
 time_biscroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 32.0f + 0.5), // 1/64
 time_semicroma = (unsigned int)(0x17D7840 * 1 * 1.6 / 16.0f + 0.5), // 1/32
 time_croma = (unsigned int)(0x17D7840 * 1 * 1.6 / 8.0f + 0.5), // 1/16
 time_semiminima = (unsigned int)(0x17D7840 * 1 * 1.6 / 4.0f + 0.5), // 1/4
 time_minima = (unsigned int)(0x17D7840 * 1 * 1.6 / 2.0f + 0.5), // 1/2
 time_semibreve = (unsigned int)(0x17D7840 * 1 * 1.6 + 0.5), // 1
} NOTE_DURATION;

typedef enum frequencies
{
 a2b = 5351, // 103Hz k=5351 a2b
 b2 = 4500, // 123Hz k=4500 b2
 c3b = 4370, // 127Hz k)4370 c3b
 c3 = 4240, // 131Hz k=4240 c3
 d3 = 3779, // 147Hz k=3779 d3
 e3 = 3367, // 165Hz k=3367 e3
 f3 = 3175, // 175Hz k=3175 f3
 g3 = 2834, // 196Hz k=2834 g3
 a3b = 2670, // 208Hz k=2670 a4b
 a3 = 2525, // 220Hz k=2525 a3
 b3 = 2249, // 247Hz k=2249 b3
 c4 = 2120, // 262Hz k=2120 c4
 d4 = 1890, // 294Hz k=1890 d4
 e4 = 1684, // 330Hz k=1684 e4
 f4 = 1592, // 349Hz k=1592 f4
 g4 = 1417, // 392Hz k=1417 g4
 a4 = 1263, // 440Hz k=1263 a4
 b4 = 1125, // 494Hz k=1125 b4
 c5 = 1062, // 523Hz k=1062 c5
 pause = 0 // DO NOT SOUND
} FREQUENCY;


typedef struct
{
 FREQUENCY freq;
 NOTE_DURATION duration;
} NOTE;

void playNote(NOTE note);
BOOL isNotePlaying(void);
# 2 "Source/music/music.c" 2

# 1 "Source/music\\../timer/timer.h" 1
# 12 "Source/music\\../timer/timer.h"
# 1 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 1 3
# 56 "C:\\Users\\giorg\\AppData\\Local\\Keil_v5\\ARM\\ARMCLANG\\bin\\..\\include\\stdint.h" 3
typedef signed char int8_t;
typedef signed short int int16_t;
typedef signed int int32_t;
typedef signed long long int int64_t;


typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long int uint64_t;





typedef signed char int_least8_t;
typedef signed short int int_least16_t;
typedef signed int int_least32_t;
typedef signed long long int int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;
typedef unsigned long long int uint_least64_t;




typedef signed int int_fast8_t;
typedef signed int int_fast16_t;
typedef signed int int_fast32_t;
typedef signed long long int int_fast64_t;


typedef unsigned int uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned int uint_fast32_t;
typedef unsigned long long int uint_fast64_t;






typedef signed int intptr_t;
typedef unsigned int uintptr_t;



typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
# 13 "Source/music\\../timer/timer.h" 2

//uint32_t init_timer ( uint8_t timer_num, uint32_t Prescaler, uint8_t MatchReg, uint8_t SRImatchReg, uint32_t TimerInterval )
//extern uint32_t init_timer( uint8_t timer_num, uint32_t timerInterval );
extern uint32_t init_timer( uint8_t timer_num, uint32_t Prescaler, uint8_t MatchReg, uint8_t SRImatchReg, uint32_t TimerInterval );
extern void enable_timer( uint8_t timer_num );
extern void disable_timer( uint8_t timer_num );
extern void reset_timer( uint8_t timer_num );
void toggle_timer( uint8_t timer_num );
unsigned int get_timer_value(uint8_t timer_num);
uint32_t is_timer_enabled ( uint8_t timer_num);
void power_on_timer2();
void power_on_timer3();
float get_timer_value_in_sec(uint8_t timer_num);


extern void TIMER0_IRQHandler (void);
extern void TIMER1_IRQHandler (void);
extern void TIMER2_IRQHandler (void);
extern void TIMER3_IRQHandler (void);
# 4 "Source/music/music.c" 2

void playNote(NOTE note)
{
 if(note.freq != pause)
 {
  reset_timer(0);
  init_timer(0, note.freq);
  enable_timer(0);
 }
 reset_timer(1);
 init_timer(1, note.duration);
 enable_timer(1);
}

BOOL isNotePlaying(void)
{
 return ((LPC_TIM0->TCR != 0) || (LPC_TIM1->TCR != 0));
}
