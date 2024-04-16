#!/bin/bash

HI='\033[0;32m'
NOCOLOR='\033[0m'

function print_color() {
    echo -e "$HI$1$NOCOLOR"
}

function grep_it() {
    grep -E --color=always $1 $2
}

if [[ $# -eq 0 ]]
then 
    file="phonebook.dat"
else
    file=$1
fi


print_color "1. Each starts or ends with Jose."
grep_it '^Jose|Jose$' $file
echo ""

print_color "2. 2.	Contain a sequence of at least 27 upper or lower-case alphabetic characters."
grep_it '[a-zA-Z]{27,}' $file
echo ""

print_color "3. 3.	Consists of more than 18 characters. The characters can be anything, including alphabetic and numeric."
grep_it '.{19,}' $file
echo ""

print_color "4.	Contains exactly 10 characters.  The characters can be anything, including alphabetic and numeric."
grep_it '^.{10}$' $file
echo ""

print_color "5. Contains a sequence between 6 and 8 upper- or lower-case alphabetic characters. The sequence must be separated from the rest of the line by a space or tab on each side."
grep_it '\s[a-zA-Z]{6,8}\s' $file
echo ""

print_color "6. Each line contains a local phone number: 3 digits dash 4 digits."
grep_it '(^|[^-])([0-9]{3}[\-][0-9]{4})(\s|$)' $file
echo ""

print_color "7. Each line contains a valid URL on a line by itself."
grep_it '^(http|HTTP)://([a-zA-Z]+\.)([a-zA-Z]+)\.(com|edu)' $file
