// Includem librariile

//#include <LiquidCrystal.h>
#include <LiquidCrystal_I2C.h>
#include <Keypad.h>

const byte ROWS = 4;
const byte COLS = 4;

// definim keyboard-ul
char keys[ROWS][COLS] = { 
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','c'},
  {'*','0','#','D'}
};

byte rowPins[ROWS] = { 2, 3, 4, 5 };  // Conectam ROW0, ROW1, ROW2 si ROW3 la pinii arduino
byte colPins[COLS] = { 6, 7, 8, 9 };  // Conectam COL1, COL2, COL3 si COL4 la pinii arduino

Keypad kpd = Keypad (makeKeymap(keys), rowPins, colPins, ROWS, COLS );  // creare tastatura

LiquidCrystal_I2C lcd(0x27, 16, 2);

 long Num1, Num2, Number;
 char key, action;
 boolean result = false;


 void setup(){
  lcd.init();                      // initializare lcd
  lcd.init();
  lcd.backlight();
  lcd.setCursor(4,0);
  lcd.print("PROIECT"); // mesaj initial rand 1
  lcd.setCursor(4, 1);
  lcd.print("ARDUINO"); //mesaj initial rand 2
  delay(5000);
  lcd.clear(); 
 }

 void loop(){
  key = kpd.getKey(); // memorez valoarea tastei apasate
  
  if(key!=NO_KEY)
  {
    DetectButtons();
  }
  if(result==true) 
  {
    CalculateResult();
  }
  DisplayResult();
 }

 void DetectButtons()
 {
  lcd.clear();
  
  if(key == '1')
  {
    if(Number == 0) Number = 1;
    else Number = (Number * 10) + 1;  // buton apasat de 2 ori
  }

  if(key == '2')
  {
    if(Number == 0) Number = 2;
    else Number = (Number *10) + 2;
  }

  if(key == '3')
  {
    if(Number == 0) Number = 3;
    else Number = (Number * 10) + 3;
  }
  
  if(key == '4')
  {
    if(Number == 0) Number = 4;
    else Number = (Number * 10) + 4;
  }

  if(key == '5')
  {
    if(Number == 0) Number = 5;
    else Number = (Number * 10) + 5;
  }

  if(key == '6')
  {
    if(Number == 0) Number = 6;
    else Number = (Number * 10) + 6;
  }
  
  if(key == '7')
  {
    if(Number == 0) Number = 7;
    else Number = (Number * 10) + 7;
  }

  if(key == '8')
  {
    if(Number == 0) Number = 8;
    else Number = (Number * 10) + 8;
  }

  if(key == '9')
  {
    if(Number == 0) Number = 9;
    else Number = (Number * 10) + 9;
  }

  if(key == '*')  // buton anulare operatie
  {
    Number = Num1 = Num2 = 0;
    result = false;
  }
  
  if(key == '0')
  {
    if(Number == 0) Number = 0;
    else Number = (Number * 10) + 0;
  }

  if(key == '#')
  {
    Num2 = Number;
    result = true;
  }
  
  if(key == 'A' || key == 'B' || key == 'C' || key == 'D')  // Butoanele din a patra coloana
  {
    Num1 = Number;
    Number = 0;
    if(key == 'A') action = '+';
    if(key == 'B') action = '-';
    if(key == 'C') action = '*';
    if(key == 'D') action = '/';
    delay(100);
  }
 }

 void CalculateResult()
 {
  if(action == '+') Number = Num1 + Num2;
  if(action == '-') Number = Num1 - Num2;
  if(action == '*') Number = Num1 * Num2;
  if(action == '/') Number = Num1 / Num2;
 }

 void DisplayResult()
 {
  lcd.setCursor(0, 0);
  lcd.print(Num1);
  lcd.print(action);
  lcd.print(Num2);
  if(result == true)  // Afisare rezultat
  {
    lcd.print(" = ");
    lcd.print(Number);
  }
  lcd.setCursor(0, 1);
  lcd.print(Number);  // Afisare rezultat
 }
