#!/bin/bash

no_tests=10
grade=0

rm date.out
touch date.out 

for i in $(seq 1 $(($no_tests))); do
	timeout 60 octave --silent --eval "strassen(\"teste/strassen"$i".in\", \"date.out\")"
	number=$?
	if [ $number -eq "0" ]; then
		octave  --silent --eval "eval(\"date.out\", \"teste/strassen"$i".out\")"
		if [[ -z $(diff "valid" "verificare") ]]; then
			grade=$(($grade+10));
			echo "test"$i".............10 puncte :)"
		else
			echo "test"$i".............0 puncte :("
		fi
	else
		echo "test"$i".............0 puncte :("
	fi
done

echo ""
if [ $grade -eq "100" ]; then 
	echo "TOTAL.................................$grade puncte, felicitari :> ";
else
	if [ $grade -gt "0" ]; then 
		echo "TOTAL.................................$grade puncte. Mai lucreaza :p ";
	else
		echo "TOTAL.................................$grade puncte. Mi-ar fi si rusine :)) ";
	fi
fi
