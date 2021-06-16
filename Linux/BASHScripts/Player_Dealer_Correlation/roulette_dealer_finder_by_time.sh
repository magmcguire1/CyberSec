#1/bin/bash
 


awk '{print $1,$2,$5,$6}' ./*$2* | grep $1 


