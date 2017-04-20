#!/bin/bash
INPUT="1B_input/input1B_"
KEY="1B_input/key1B_"
REF_OUT="1B_ref/ref_out1B_"

for i in {1..10}; do
  echo -n "Testul "$i": "
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1B
  cp $curr_key key1B

#   cp $curr_ref_out 'ref1B'
#   cp 'int_inv_key1A_'$i 'int_inv_key1A'

  octave --eval decrypt.m &> /dev/null

  cp output1B tmp_out
  cp $curr_ref_out tmp_ref
  echo '' >> tmp_out
  echo '' >> tmp_ref
  diff --ignore-all-space tmp_out tmp_ref
  rm tmp_out tmp_ref
done

