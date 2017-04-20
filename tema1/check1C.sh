#!/bin/bash
INPUT="1C_input/input1C_"
KEY="key1C"
REF_OUT="1C_ref/ref_out1C_"

for i in 2; do
  echo "Testul "$i": "
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1C

  octave --eval transposition 

  diff -c output1C $curr_ref_out
done
