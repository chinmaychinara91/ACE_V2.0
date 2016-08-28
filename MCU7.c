#define F_CPU 8000000UL

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <lcd.h>

void USARTInit(uint16_t);
char USARTReadChar(void);
void USARTWriteChar(char);
void Init_PWM(void);

void USARTInit(uint16_t ubrr_value)
{
 UBRRL = ubrr_value;
 UBRRH = (ubrr_value>>8);
 UCSRC=(1<<URSEL)|(3<<UCSZ0);
 UCSRB=(1<<RXEN)|(1<<TXEN);
}

char USARTReadChar(void)
{
 while(!(UCSRA & (1<<RXC)));
 return UDR;
}

void USARTWriteChar(char data)
{
 while(!(UCSRA & (1<<UDRE)));
 UDR=data;
}

void Init_PWM(void)
{
 TCCR1A|=(1<<COM1A1)|(1<<COM1B1)|(1<<WGM11);        
 TCCR1B|=(1<<WGM13)|(1<<WGM12)|(1<<CS11)|(1<<CS10); 
 ICR1=2499; 

 DDRD|=(1<<PD4)|(1<<PD5);
}

int main(void)
{
 char data;
 char add1,add2;
 char vl,vh,value;
 value = 0x00;

 InitLCD(0);
 Init_PWM();

 OCR1A=250; //rarm  
 OCR1B=67; //rslr

 USARTInit(51);
 LCDClear();
 LCDWriteStringXY(0,0,"Initialising...");
 _delay_ms(1000);
 
 LCDClear();
 LCDWriteStringXY(0,0,"RARM=");
 LCDWriteStringXY(0,1,"RSLR=");

 while(1)
 {
  data = USARTReadChar();
  _delay_ms(100);
  add1 = data & 0x0f;
  switch (add1)
  {
   case 0x02:  //2
   vl = data>>4;
   data = USARTReadChar();
   add2 = data & 0x0f;
   if (add2 == 0x0A) //10
	{
	 vh = data & 0xf0;
	 value =  vl | vh;
	 if ((value >= 0) && (value <= 500))
	 {
	  OCR1A =75+value; 
	  LCDWriteIntXY(6,0,value,3);
	  _delay_ms(1000);
     }
	 else
	 { 
	 	LCDWriteStringXY(6,0,"inv angle");
		_delay_ms(1000);
	 }
	 break;
    }
   else 
   break;
   break;
  
   case 0x03:  //3
   vl = data>>4;
   data = USARTReadChar();
   add2 = data & 0x0f;
   if (add2 == 0x0B) //11
	{
	 vh = data & 0xf0;
	 value =  vl | vh;
	 if ((value >= 0) && (value <= 500))
	 {
	  OCR1B = 67+value; 
	  LCDWriteIntXY(6,1,value,3);
	  _delay_ms(1000);
     }
	 else
	 { 
	 	LCDWriteStringXY(6,1,"inv angle");
		_delay_ms(1000);
	 }
	 break;
    }
   else 
   break;
   break;

   default:
   add1 = 0xff;
  }
 }
 return 1;
}
