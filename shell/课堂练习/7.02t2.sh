#!/bin/bash
pass=
# shellcheck disable=SC2034
for j in {1..100}
do
for i in {1..8}
do
x=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789
n=$((RANDOM%62))
pass+=${x:$n:1}
done
echo "$pass";
pass=
done