#!/bin/bash

> "calo"    # reset calo
> "calokey" # reset calo key

result="DaltonSloanLab9.txt"
echo "Dalton Sloan Lab 09" > $result # setup new result

kq9="keyOutputQ9.txt"
kq8="keyOutputQ8.txt"
kq7="keyOutputQ7.txt" #set up key outputs
kq6="keyOutputQ6.txt"
kq5="keyOutputQ5.txt"
kq4="keyOutputQ4.txt"
kq3="keyOutputQ3.txt"
kq2="keyOutputQ2.txt"
kq1="keyOutputQ1.txt"

find /usr/bin -name 'c*' > $kq1 # setup key commands
find /usr/bin -name '*sh*' -type l > $kq2
find /usr | head > $kq3
grep "model name" /proc/cpuinfo > $kq4
grep -cv sudo /etc/group > $kq5
grep -n sudo /etc/group > $kq6
sort food > $kq7
sort -r food > $kq8
sort --key=2 food > $kq9
sort -nr --key=4 --key=3 -o caloKey food

sq9="sOut9.txt"
sq8="sOut8.txt" # set up student outputs
sq7="sOut7.txt"
sq6="sOut6.txt"
sq5="sOut5.txt"
sq4="sOut4.txt"
sq3="sOut3.txt"
sq2="sOut2.txt"
sq1="sOut1.txt"

find /usr/bin -type f -name "c*" > $sq1
find /usr/bin -type l -name "*sh" > $sq2
find /usr -type f | head -n 10 > $sq3
grep 'model name' /proc/cpuinfo  > $sq4
grep -vc sudo /etc/group > $sq5 # setup students outputs manually
grep 'sudo' /etc/group > $sq6
echo "none" > $sq7
echo "none" > $sq8
echo "none" > $sq9
sort -k4,4nr -k3,3nr food > calo

stuArray=("$sq1" "$sq2" "$sq3" "$sq4" "$sq5" "$sq6" "$sq7" "$sq8" "$sq9" "calo") # setup student array
keyArray=("$kq1" "$kq2" "$kq3" "$kq4" "$kq5" "$kq6" "$kq7" "$kq8" "$kq9" "calokey") #setup key array

counter=1
for (( i = 0; i < 10; i++ ));
do
      if diff -q "${keyArray[$i]}" "${stuArray[$i]}" > /dev/null;
      then
         echo $counter ": This student's output is correct" >> $result
      else
         echo $counter ": This student's output is incorrect" >> $result
      fi
      (( counter++ ))
done
