#!/bin/bash
useradd $1
echo '123456' | passwd --stdin $1