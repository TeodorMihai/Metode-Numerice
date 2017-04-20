#!/bin/bash
INPUT="1A_input/input1A_"
KEY="1A_input/key1A_"
REF_OUT="1A_ref/ref_out1A_"

for i in {1..10}; do
  echo -n "Testul "$i": "
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1A
  cp $curr_key key1A

  octave --eval matrixCipher.m &> /dev/null

  cp output1A tmp_out
  cp $curr_ref_out tmp_ref
  echo '' >> tmp_out
  echo '' >> tmp_ref
  diff --ignore-all-space tmp_out tmp_ref
  rm tmp_out tmp_ref
done
