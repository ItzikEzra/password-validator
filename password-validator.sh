#!/bin/bash
password=$1 #if -f not in use,we will take the password from the first argumant

password_length=${#password} #retriving password length
violation_flag=0             #Responsible for the keeping laws
#violation_flag=0 -->password is valid
#violation_flag=1 -->password is invalid

#validation of length rule
if (($password_length < 10)); then
    echo "Rule violation!:your password should be at least 10 characters"
    violation_flag=1
fi
#validation of alfabatic and digits rule
if ! [[ $password =~ [[:alpha:]] && $password =~ [[:digit:]] ]]; then
    echo "Rule violation!:your password should contain leteers and digits"
    violation_flag=1
fi
#validation of upper and lowwer letters rule
if [[ ! $password =~ [[:upper:]] || ! $password =~ [[:lower:]] ]]; then
    echo "Rule violation!:your password should contain  capital and smallleteers"
    violation_flag=1
fi
if ((violation_flag == 0)); then #if nothing was catched, password is valid
    echo "$(tput setaf 2)$password"
    exit 0
else #else, password invalid
    echo "$(tput setaf 1)$password"
    exit 1
fi
