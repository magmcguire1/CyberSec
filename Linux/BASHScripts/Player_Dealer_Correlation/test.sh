awk '{print $1,$2,$5,$6}' ./$1 | grep -e '05:00:00 AM' -e '08' -e '02:00:00 PM' -e '11:00:00 PM' > $1_Notes.txt
