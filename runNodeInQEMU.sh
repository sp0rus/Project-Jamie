#!/bin/sh

# Copyright 2011 James Church and John Stitt
# This file is part of Project Jamie

#   Project Jamie is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.

#   Project Jamie is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with Project Jamie.  If not, see <http://www.gnu.org/licenses/>.

LAST_ELEM=$1

if [ $# -ne 1 ]
then
    LAST_ELEM=46
    echo "Each machine needs to have a different MAC address to have a unique IP address"
    echo "By default, the script uses '46' as this argument. For subsequent virtual"
    echo "machines, use '47' for the second, '48' for the third, etc. For example:"
    echo
    echo "sudo sh $0 47"
    echo
    echo "If they all run with the same MAC address, each machine will have the same IP"
    echo "address and the proof of concept will not work."
    echo
    echo
fi

ARGS="-boot d -cdrom livecd/binary.iso -net nic,vlan=0,macaddr=52:54:00:12:34:$LAST_ELEM -net tap,vlan=0,script=/etc/qemu-ifup -m 256 -localtime"

echo "Starting QEMU with..."
echo $ARGS
echo "...."
exec qemu $ARGS

