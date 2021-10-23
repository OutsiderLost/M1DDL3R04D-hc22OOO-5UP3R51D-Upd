#!/bin/bash

mkdir /root/middleroad
mkdir /root/middleroad/essidcheck
mkdir /root/middleroad/ABCproced
mkdir /root/middleroad/Clean
mkdir /root/middleroad/essidcheck/other

sed -n w"allmerge.hc22000" *.hc22000
sed -e '/^[[:space:]]*$/d' -e 's/[ ]//g' allmerge.hc22000 | sort -u > /root/middleroad/allmergeSORT.hc22000

echo Create folders root-middleroad......
echo MERGE AND SORT THE FILE

cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' | sort -u | hashcat --stdout > /root/middleroad/essidcheck/essidnamecheckSORT-01.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' | sort -u > /root/middleroad/essidcheck/other/essidnameHexmarkSORT.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $5 "]" }' | sort -u > /root/middleroad/essidcheck/other/macclientHexmarkSORT.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $4 "]" }' | sort -u > /root/middleroad/essidcheck/other/macapHexmarkSORT.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "" $6 "" }' | sort -u > /root/middleroad/essidcheck/other/essidnameHexSORT.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "" $5 "" }' | sort -u > /root/middleroad/essidcheck/other/macclientSORT.txt
cat /root/middleroad/allmergeSORT.hc22000 | awk 'BEGIN { FS = "*" } ; {print "" $4 "" }' | sort -u > /root/middleroad/essidcheck/other/macapSORT.txt
sort -u /root/middleroad/essidcheck/essidnamecheckSORT-01.txt -o /root/middleroad/essidcheck/other/essidnametextSORT.txt

cat /root/middleroad/essidcheck/other/essidnametextSORT.txt | python3 -c "import sys; print(sys.stdin.read().title())" | sed -e '/^[[:space:]]*$/d' > /root/middleroad/essidcheck/other/U-Pc-py-essidnametextSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/UPessidnametextSORT-01.txt
sed 's/\(.*\)/\L\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/LOWessidnametextSORT-01.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/essidnameHexmarkSORT.txt > /root/middleroad/essidcheck/other/UPessidnameHexmarkSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/essidnameHexSORT.txt > /root/middleroad/essidcheck/other/UPessidnameHexSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/macclientHexmarkSORT.txt > /root/middleroad/essidcheck/other/UPmacclientHexmarkSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/macapHexmarkSORT.txt > /root/middleroad/essidcheck/other/UPmacapHexmarkSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/macclientSORT.txt > /root/middleroad/essidcheck/other/UPmacclientSORT.txt
sed 's/\(.*\)/\U\1/' /root/middleroad/essidcheck/other/macapSORT.txt > /root/middleroad/essidcheck/other/UPmacapSORT.txt
sed -e 's/\(.*\)/\L\1/' -e 's/\b\(.\)/\U\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Up-essidnametextSORT.txt
sed -e 's/\(.*\)/\L\1/' -e 's/\b\(.\)/\U\1/g' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/U-PessidnametextSORT.txt
sed -e 's/\(.*\)/\U\1/' -e 's/\b\(.\)/\L\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/uP-essidnametextSORT.txt
sed -e 's/\(.*\)/\U\1/' -e 's/\b\(.\)/\L\1/g' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/u-pessidnametextSORT.txt

sed 's/\b\(.\)/\U\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Up1-essidnametextSORT.txt
sed 's/\b\(.\)/\L\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Low1-essidnametextSORT.txt
sed 's/\b\(.\)/\U\1/g' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/U-Pc-essidnametextSORT.txt
sed 's/\b\(.\)/\L\1/g' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Lo-Wc-essidnametextSORT.txt
sed 's/.$/\U&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/uPend-essidnametextSORT.txt
sed 's/.$/\L&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/loWend-essidnametextSORT.txt
sed -e 's/\(.*\)/\u\1/' -e 's/.$/\U&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/U-def-U-essidnametextSORT.txt
sed -e 's/\(.*\)/\l\1/' -e 's/.$/\L&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/L-def-L-essidnametextSORT.txt
sed -e 's/\(.*\)/\L\1/' -e 's/.$/\U&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/low-U-essidnametextSORT.txt
sed -e 's/\(.*\)/\U\1/' -e 's/.$/\L&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/UP-L-essidnametextSORT.txt
sed -e 's/\(.*\)/\L\1/' -e 's/.$/\U&/' -e 's/\b\(.\)/\U\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/U-L-U-essidnametextSORT.txt
sed -e 's/\(.*\)/\U\1/' -e 's/.$/\L&/' -e 's/\b\(.\)/\L\1/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/L-U-L-essidnametextSORT.txt
sed -e 's/\(.*\)/\L\1/' -e 's/\b\(.\)/\U\1/g' -e 's/.$/\U&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Ucont-d-U-essidnametextSORT.txt
sed -e 's/\(.*\)/\u\1/' -e 's/\b\(.\)/\L\1/g' -e 's/.$/\L&/' /root/middleroad/essidcheck/other/essidnametextSORT.txt > /root/middleroad/essidcheck/other/Lcont-d-L-essidnametextSORT.txt


sed -n w"mergewordlist.txt" /root/middleroad/essidcheck/other/*.txt
sed -e '/^[[:punct:]]*$/d' -e 's/[[:punct:] ]//g' mergewordlist.txt > /root/middleroad/essidcheck/other/FullWordlistNOPUNCT.txt
sed -n w"mergewordlist02.txt" /root/middleroad/essidcheck/other/*.txt
sort -u mergewordlist02.txt -o /root/middleroad/essidcheck/other/FullWordlist.txt

echo ESSIDS EXTRATION OF ESSIDS FOR CONTROL
echo MAC_CLIENT, MAC_AP, ESSID extract HEX format and uppercase copy inthe -other folder.
echo Created BONUS sorted Wordlist inthe -other folder.

grep 'WPA\*01' /root/middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > /root/middleroad/ABCproced/A-sortpmkid.hc22000
grep '2$' /root/middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > /root/middleroad/ABCproced/B-sortauthorized.hc22000
grep '0$' /root/middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > /root/middleroad/ABCproced/C-sortchallenge.hc22000

echo Separation of PMKID and EAPOL -- from and authentic and challenge point of view--

sed -n w"BC-alleapol.hc22000" /root/middleroad/ABCproced/B-sortauthorized.hc22000 /root/middleroad/ABCproced/C-sortchallenge.hc22000
sed -n w"allABCprobe.hc22000" /root/middleroad/ABCproced/A-sortpmkid.hc22000 /root/middleroad/ABCproced/B-sortauthorized.hc22000 /root/middleroad/ABCproced/C-sortchallenge.hc22000

sort -t "*" -k 6,6 -u BC-alleapol.hc22000 -o /root/middleroad/ABCproced/BC-sortalleapol.hc22000

sed 's/[ ]//g' allABCprobe.hc22000 | sort -t "*" -k 6,6 -u | sort -u > /root/middleroad/Clean/CleanABCsortprobe.hc22000
sed 's/[ ]//g' allABCprobe.hc22000 | sort -t "*" -k 6,6 -u > /root/middleroad/essidcheck/CleanABCsortprobecheck.hc22000

sed -n w"allABCmerge.hc22000" /root/middleroad/ABCproced/A-sortpmkid.hc22000 /root/middleroad/ABCproced/BC-sortalleapol.hc22000

sed 's/[ ]//g' allABCmerge.hc22000 | sort -t "*" -k 6,6 -u | sort -u > /root/middleroad/Clean/CleanABCsortmerge.hc22000
sed 's/[ ]//g' allABCmerge.hc22000 | sort -t "*" -k 6,6 -u > /root/middleroad/essidcheck/CleanABCsortmergecheck.hc22000

cat /root/middleroad/essidcheck/CleanABCsortprobecheck.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' | hashcat --stdout > /root/middleroad/essidcheck/essidnameprobecheckSORT-02.txt
cat /root/middleroad/essidcheck/CleanABCsortmergecheck.hc22000 | awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' | hashcat --stdout > /root/middleroad/essidcheck/essidnamemergecheckSORT-02.txt

echo Separation operations performed. Additional essidname files createdfor checking.

rm allmerge.hc22000
rm /root/middleroad/essidcheck/CleanABCsortprobecheck.hc22000
rm /root/middleroad/essidcheck/CleanABCsortmergecheck.hc22000
rm mergewordlist.txt
rm mergewordlist02.txt
rm /root/middleroad/essidcheck/other/FullWordlistNOPUNCT.txt
rm /root/middleroad/essidcheck/other/Up1-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/Low1-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/U-Pc-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/Lo-Wc-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/uPend-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/loWend-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/U-def-U-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/L-def-L-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/low-U-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/UP-L-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/U-L-U-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/L-U-L-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/Ucont-d-U-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/Lcont-d-L-essidnametextSORT.txt
rm /root/middleroad/essidcheck/other/U-PessidnametextSORT.txt
mv allABCmerge.hc22000 /root/middleroad/ABCproced/
mv allABCprobe.hc22000 /root/middleroad/ABCproced/
mv BC-alleapol.hc22000 /root/middleroad/ABCproced/

echo Unnecessary files removed. Opened the -root-middleroad folder...

open /root/middleroad

echo CHECK RESULT -essidcheck -- essidnamemergecheckSORT-02.txt --- essidnamecheckSORT-01.txt --

echo CHECK RESULT -essidcheck -- essidnameprobecheckSORT-02.txt --- essidnamecheckSORT-01.txt --

echo The results must match.

echo If all is well, feel freeto use -Clean -- CleanABCsortmerge.hc22000
