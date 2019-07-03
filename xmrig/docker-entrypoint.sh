#!/bin/sh

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]
then
      numthreads=$(($(nproc)-1))
      echo "\$numthreads is empty: set to $numthreads"
else
      echo "\$numthreads is NOT empty"
fi

if [ -z "$startport" ]
then
      startport=8100
      echo "\$startport is empty: set to $startport"
else
      echo "\$startport is NOT empty"
fi


if [ -z "$xmrpool" ]
then
      xmrpool=xmr-usa.dwarfpool.com
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
      username=471g89vAy7LWuTMDmypJ12PGLi7fscmh845GBHxsNE6XWEYMc4PYrVFAxav9suoBRA9pc4jKNF3M4E2bZc6ZoHLW9gzuMPu
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

