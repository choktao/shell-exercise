#!/bin/bash
uadd() {
    useradd $1
    echo $1 | passwd --stdin $2
}
uadd()

