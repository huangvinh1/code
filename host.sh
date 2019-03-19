#!/bin/bash


if [ "$interface" != "ens33"]
then
  return
fi

if [ "$reason" != BOUND ] && [ "$reason" != RENEW] \
  && [ "$reason" != REBIND ] && [ "$reason" != REBOOT ]
then
  return
fi

echo dhclient-exit-hooks.d/hostname: Dynamic IP address =$new_ip_address
hostname=$(host $new_ip_address | cut -d ' ' -f 5 | sed -r 's/((.*)[^\.])\.?/\1/g' )
echo $hostname > /etc/hostname
hostname $hostname
echo dhclient-exit-hooks.d/hostname: Dynamic Hostname= $hostname
