# BadUSB-DigiSpark Keyboard #

Simple script for setting up a reversed shell or execute two powershell scripts see Powershell directory for more information.

# Send-LSASS-Dump #

Started this script for a BadUSB Digispark project, script for retrieving lsass dump with sysinternals procdump tool.
Dump file is automatically send to an email address which can be configured in the variables.

After receiving the dump file you can examine it and retreive the passwords.
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

Script for retreiving wlan profile information and clear text passwords, started this script for a badUSB Digispark project.
Text file is automatically send to an email address which can be configured in the variables.

Only use this for learning purposes.
