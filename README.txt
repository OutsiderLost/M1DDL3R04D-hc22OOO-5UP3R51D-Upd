# M1DDL3R04Dhc22OO-5UP3551D*updated*

The script that sorts the accumulated hc22000 list.
It prefers pmkids over eapol, it also leaves insecure "challenge" message pairs if there is no better one instead.

It stores operations in separate folders, and finally checks all important files after work.
The files left behind can also be traced manually for verification.

It collects all ESSIDs, MAC_AP and MAC_CLIENT and then as a bonus writes a wordlist of everything, with bare HEX, played with lowercase and uppercase letters.

* * * * * * * * * * * * * * * * * * * * * * * * * * *
New updates to the script:
Implementing a password list generation from Essid is more sophisticated. The script itself creates several files to check:
(The A and BC text files can be checked together. ABCprobe works together, so it must contain more text than the ABCmerge text file!)
(Until now, Python was not needed, now it is needed, because they could not find a better command that would have been able to make character changes after every punctuation without exception. :'D
* * * * * * * * * * * * * * * * * * * * * * * * * * *

--------------------------------------------------------------------------------------------------------------------------------------------------------------------
HOW TO USE:

<< Nefore doing so, make sure you have HASHCAT and PYTHON installed and have other basic Linux resources >>
<< Kali Linux already has all the basic needs in general >>

Place the file where your accumulated hc2200 files lie, (the script will automatically merge them).

(example)
cd /root/xxxhc2200folderxxx/middleroad.sh

chmod +x middleroad.sh

(run)
./middleroad.sh

(it presents the processes at the bottom and finally drops them into the created folders)

(keep in mind that this script sorts by ESSID, if you want to it by MAC, for example, you can modify the script: change the 6.6 to 5.5 -> based on MAC-CLIENT, change to 4.4 -> based on MAC-AP.)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------