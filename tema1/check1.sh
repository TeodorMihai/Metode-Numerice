#!/bin/bash
INPUT="1A_input/input1A_"
KEY="1A_input/key1A_"
REF_OUT="1A_ref/ref_out1A_"
total_points=90
points=0.0

printf "matrixCipher:\n"
for i in {1..10}; do
  printf "Test %02d" $i
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1A
  cp $curr_key key1A

  octave --eval matrixCipher.m &> /dev/null
  for ((k = 0; k < 53; k++)); do
      printf "."
  done

  cp output1A tmp_out
  cp $curr_ref_out tmp_ref
  echo '' >> tmp_out
  echo '' >> tmp_ref

  diff --ignore-all-space tmp_out tmp_ref
  if diff --ignore-all-space tmp_out tmp_ref >/dev/null ; then
      points=$(bc <<< "$points+1.5")
      printf "passed\n"
  else
      printf "failed\n"
  fi

  rm tmp_out tmp_ref output1A
done

INPUT="1B_input/input1B_"
KEY="1B_input/key1B_"
REF_OUT="1B_ref/ref_out1B_"

printf "decrypt:\n"
for i in {1..10}; do
  printf "Test %02d" $i
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1B
  cp $curr_key key1B

  octave --eval decrypt.m &> /dev/null
  for ((k = 0; k < 53; k++)); do
      printf "."
  done

  cp output1B tmp_out
  cp $curr_ref_out tmp_ref
  echo '' >> tmp_out
  echo '' >> tmp_ref

  diff --ignore-all-space tmp_out tmp_ref
  if diff --ignore-all-space tmp_out tmp_ref >/dev/null ; then
      points=$(bc <<< "$points+1.5")
      printf "passed\n"
  else
      printf "failed\n"
  fi

  rm tmp_out tmp_ref output1B
done

INPUT="1C_input/input1C_"
KEY="key1C"
REF_OUT="1C_ref/ref_out1C_"

printf "transposition:\n"
for i in {1..10}; do
  printf "Test %02d" $i
  curr_input=$INPUT$i
  curr_key=$KEY$i
  curr_ref_out=$REF_OUT$i
  cp $curr_input input1C

  octave --eval transposition &> /dev/null
  for ((k = 0; k < 53; k++)); do
      printf "."
  done
  if diff --ignore-all-space output1C $curr_ref_out >/dev/null ; then
      points=$(bc <<< "$points+1.5")
      printf "passed\n"
  else
      printf "failed\n"
  fi
done

printf "Total="
bc <<< "$points"
