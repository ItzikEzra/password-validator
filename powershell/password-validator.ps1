
$password = $args[0] #Input from the user
$exist_uppercase =$password -cmatch "[A-Z]" #equel true if password contain uppercase letter
$exist_lowercase =$password -cmatch "[a-z]" #equel true if password contain lowercase letter
$exist_digits=$password -cmatch "[0-9]"     #equel true if password contaon digit
$violation_flag=0

if ($password.Length -lt 10){ #validation of length rule
    $violation_flag=1
     write-host "Rule violation!:your password should be at least 10 characters"
}
if(-not$exist_uppercase){ #validation of  uppercsae rule
    $violation_flag=1
     write-host "Rule violation!:your password should be at least one uppercase latter"
}
if(-not$exist_lowercase){#validation of  lowercase rule
    $violation_flag=1
     write-host "Rule violation!:your password should be at least one lowercase latter"
}
if(-not$exist_digits){#validation of  digit rule
    $violation_flag=1
     write-host "Rule violation!:your password should be at least one digit"
}
if ($violation_flag -eq 0){
    write-host "$password" -ForegroundColor Green
}
else{
    write-host "$password" -ForegroundColor Red
}
exit $violation_flag