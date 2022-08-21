#!/bin/bash

# ---- middleroad (noessidwork) ---------------------------------------------
echo -e "\n---- middleroad simple (noessidwork) ------------------------\n"

ls *hc22000 >/dev/null 2>&1 || echo -e 'n\No found .*22000 file! EXIT !!!\n'
ls *hc22000 >/dev/null 2>&1 || exit

mkdir middleroad
mkdir middleroad/essidcheck
mkdir middleroad/ABCproced
mkdir middleroad/Clean

sed -n w"allmerge.hc22000" *.hc22000
sed -e '/^[[:space:]]*$/d' -e 's/[ ]//g' allmerge.hc22000 | sort -u > middleroad/allmergeSORT.hc22000

echo "Create folders middleroad......"
echo " "
echo "MERGE AND SORT THE FILE"
echo " "

# awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' middleroad/allmergeSORT.hc22000 | sort -u | hashcat --stdout > middleroad/essidcheck/essidnamecheckSORT_01.txt
sort -t "*" -k 6,6 -u middleroad/allmergeSORT.hc22000 | awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' > middleroad/essidcheck/essidnamecheckSORT_01.txt

# no run file this before process (check)
sed 's/[ ]//g' middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u | sort -u | awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' > middleroad/essidcheck/norowjustcheck.txt

grep 'WPA\*01' middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > middleroad/ABCproced/A_sortpmkid.hc22000
grep '2$' middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > middleroad/ABCproced/B_sortauthorized.hc22000
grep '0$' middleroad/allmergeSORT.hc22000 | sort -t "*" -k 6,6 -u > middleroad/ABCproced/C_sortchallenge.hc22000

echo "Separation of PMKID and EAPOL from and authentic and challenge point of view"
echo " "

sed -n w"BC_alleapol.hc22000" middleroad/ABCproced/B_sortauthorized.hc22000 middleroad/ABCproced/C_sortchallenge.hc22000
sed -n w"allABCprobe.hc22000" middleroad/ABCproced/A_sortpmkid.hc22000 middleroad/ABCproced/B_sortauthorized.hc22000 middleroad/ABCproced/C_sortchallenge.hc22000

sort -t "*" -k 6,6 -u BC_alleapol.hc22000 -o middleroad/ABCproced/BC_sortalleapol.hc22000

sed 's/[ ]//g' allABCprobe.hc22000 | sort -t "*" -k 6,6 -u | sort -u > middleroad/Clean/CleanABCsortprobe.hc22000
sed 's/[ ]//g' allABCprobe.hc22000 | sort -t "*" -k 6,6 -u > middleroad/essidcheck/CleanABCsortprobecheck.hc22000

sed -n w"allABCmerge.hc22000" middleroad/ABCproced/A_sortpmkid.hc22000 middleroad/ABCproced/BC_sortalleapol.hc22000

sed 's/[ ]//g' allABCmerge.hc22000 | sort -t "*" -k 6,6 -u | sort -u > middleroad/Clean/CleanABCsortmerge.hc22000
sed 's/[ ]//g' allABCmerge.hc22000 | sort -t "*" -k 6,6 -u > middleroad/essidcheck/CleanABCsortmergecheck.hc22000

# check essid out clean file (check)
sed 's/[ ]//g' allABCmerge.hc22000 | sort -t "*" -k 6,6 -u | sort -u | awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' > middleroad/essidcheck/CleanABCsortmergeESSIDcheck.txt
# created merge clean file essids with real file! (use)
awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' middleroad/Clean/CleanABCsortmerge.hc22000 > middleroad/Clean/CleanABCsortmergeESSID.txt

#awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' middleroad/essidcheck/CleanABCsortprobecheck.hc22000 | hashcat --stdout > middleroad/essidcheck/essidnameprobecheckSORT_02.txt
#awk 'BEGIN { FS = "*" } ; {print "$HEX[" $6 "]" }' middleroad/essidcheck/CleanABCsortmergecheck.hc22000 | hashcat --stdout > middleroad/essidcheck/essidnamemergecheckSORT_02.txt
awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' middleroad/essidcheck/CleanABCsortprobecheck.hc22000 > middleroad/essidcheck/essidnameprobecheckSORT_02.txt
awk -F "*" '{ system("echo " $6 " | xxd -r -p; echo" ) }' middleroad/essidcheck/CleanABCsortmergecheck.hc22000 > middleroad/essidcheck/essidnamemergecheckSORT_02.txt

echo "Separation operations performed. Additional essidname files createdfor checking."
echo " "

rm middleroad/essidcheck/CleanABCsortprobecheck.hc22000 middleroad/essidcheck/CleanABCsortmergecheck.hc22000
mv allABCmerge.hc22000 allABCprobe.hc22000 BC_alleapol.hc22000 middleroad/ABCproced

echo "Unnecessary files removed. Opened the middleroad folder..."
echo " "
rm allmerge.hc22000


echo "CHECK RESULT middleroad/essidcheck -> essidnamemergecheckSORT_02.txt <-> essidnamecheckSORT_01.txt <-"
echo "CHECK RESULT middleroad/essidcheck -> essidnameprobecheckSORT_02.txt <-> essidnamecheckSORT_01.txt <-"
echo "CHECK RESULT middleroad/essidcheck -> CleanABCsortprobe.hc22000 <-> CleanABCsortmerge.hc22000 <-"
echo "(The results must match)."
echo " "
echo "use -> middleroad/Clean/CleanABCsortmerge.hc22000"
