#!/bin/bash

FOLDER_SOURCE="get_next_line"

COLOR_REST="$(tput sgr0)"
COLOR_RED="$(tput setaf 1)"
COLOR_GREEN="$(tput setaf 2)"

KO_COUNT=0
OK_COUNT=0

clear
gcc -include "../$FOLDER_SOURCE/get_next_line.h" -D BUFFER_SIZE=32 -g3 -fsanitize=address ../$FOLDER_SOURCE/*.c main.c
echo "Compilation success"
echo "========================================================================="

for f in text_file/*
do
	./a.out $f > temp
	result=`diff temp $f`
	if [ -z "$result" ]
	then
		((OK_COUNT++))
		echo $f $COLOR_GREEN 'OK' $COLOR_REST
	else
		((KO_COUNT++))
		echo $f $COLOR_RED ' KO' $COLOR_REST
	fi
done

echo "========================================================================="
if (( KO_COUNT > 0 ));
then
	echo $COLOR_RED "Error" $COLOR_REST
else
	echo $COLOR_GREEN "Success" $COLOR_REST
fi
