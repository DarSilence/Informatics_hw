#!/bin/bash
IFS='.' read -ra list <<< $1
ans=""
for j in "${list[@]}"
do
num=''
cur=$j
for ((i=7; i>=0; i--))
do
num="$num$(($cur / $((2**$i))))"
cur=$(($cur-$(($(($cur / $((2**$i)))) * $((2**$i))))))
done
if [ -z "$ans" ]
then
ans="$num"
else
ans="$ans.$num"
fi
done
echo "$ans"
