#!/bin/bash

if [[ ${#@} > 0 ]]; then
  $@
  exit
fi

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]
then
      for cache in $(lscpu | grep cache | sed "s/.* \([0-9]*\)K.*/\1/"); do ((mem+=cache)); done
	  ((numthreads=$(nproc)*mem/2048))
      echo "\$numthreads is empty: set to $numthreads"
else
      echo "\$numthreads is NOT empty"
fi

if [ -z "$startport" ]
then
      startport=5555
      echo "\$startport is empty: set to $startport"
else
      echo "\$startport is NOT empty"
fi


if [ -z "$xmrpool" ]
then
      xmrpool=pool.supportxmr.com
      echo "\$xmrpool is empty: set to $xmrpool"
else
      echo "\$xmrpool is NOT empty"
      echo Using --- $xmrpool
fi

if [ -z "$password" ]
then
      echo "\$password is empty"
      password=x
      echo Using --- $password
else
      echo "\$password is NOT empty"
fi

if [ -z "$username" ]
then
      echo "\$username is empty: thank you ;)"
      username=4Hm3YrYNgczRAP7jbGCZ7vA8XwbBR8DWMU7Bm9FKZqjxQXPPcwMP1kDbK3mtBSdt2c6TmLCPiMSXa39uBiEBwkg4FVW5QXNsnsqNrdw7km
fi

if [ -z "$donate" ]
then
      echo "\$donate is empty"
      xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads
      echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads
else
      echo "\$donate is NOT empty"
      echo -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate
      xmrig -o stratum+tcp://$xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate
fi

