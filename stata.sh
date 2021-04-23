#!/bin/bash
pdir=$(cd $(dirname $0) && pwd)
base=$(basename $0)
this=$pdir/$base
if [ -z "$STATA_HOME" ]; then
    what=PATH
    for path in $(which $base --all); do
        [ "$path" == "$this" ] || break
    done
else
    path="$STATA_HOME/$base"
    what=STATA_HOME
fi
if [ "$path" == "$this" ]; then
   echo "ERROR: could not find $base binary" 1>&2
   exit -1
elif [ ! -x $path ]; then
   echo "ERROR: executable not found: $path" 1>&2
   exit -1
else
   echo "Found with $what: $path" 1>&2
fi
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib
exec $path "$@"
