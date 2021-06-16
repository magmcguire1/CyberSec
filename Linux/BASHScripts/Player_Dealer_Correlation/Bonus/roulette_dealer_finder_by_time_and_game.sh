#!/bin/bash

if [ $4 = B ]
then
grep $2 *$1*| grep $3 | awk '{print "The Blackjack Dealer is ",$3,$4}'
fi

if [ $4 = R ]
then
grep $2 *$1* | grep $3 | awk '{print "The Roulette Dealer is ",$5,$6}'
fi

if [ $4 = T ]
then
grep $2 *$1* | grep $3 | awk '{print "The Texas Hold-Em Dealer is ",$7,$8}'
fi 

