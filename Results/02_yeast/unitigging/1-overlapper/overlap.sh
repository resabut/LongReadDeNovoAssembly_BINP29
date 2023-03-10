#!/bin/sh


#  Path to Canu.

bin="/home/inf-38-2022/anaconda3/envs/longread/bin"

#  Report paths.

echo ""
echo "Found perl:"
echo "  " `which perl`
echo "  " `perl --version | grep version`
echo ""
echo "Found java:"
echo "  " `which /home/inf-38-2022/anaconda3/envs/longread/lib/jvm/bin/java`
echo "  " `/home/inf-38-2022/anaconda3/envs/longread/lib/jvm/bin/java -showversion 2>&1 | head -n 1`
echo ""
echo "Found canu:"
echo "  " $bin/canu
echo "  " `$bin/canu -version`
echo ""


#  Environment for any object storage.

export CANU_OBJECT_STORE_CLIENT=
export CANU_OBJECT_STORE_CLIENT_UA=
export CANU_OBJECT_STORE_CLIENT_DA=
export CANU_OBJECT_STORE_NAMESPACE=
export CANU_OBJECT_STORE_PROJECT=




#  Discover the job ID to run, from either a grid environment variable and a
#  command line offset, or directly from the command line.
#
if [ x$CANU_LOCAL_JOB_ID = x -o x$CANU_LOCAL_JOB_ID = xundefined -o x$CANU_LOCAL_JOB_ID = x0 ]; then
  baseid=$1
  offset=0
else
  baseid=$CANU_LOCAL_JOB_ID
  offset=$1
fi
if [ x$offset = x ]; then
  offset=0
fi
if [ x$baseid = x ]; then
  echo Error: I need CANU_LOCAL_JOB_ID set, or a job index on the command line.
  exit
fi
jobid=`expr -- $baseid + $offset`
if [ x$baseid = x0 ]; then
  echo Error: jobid 0 is invalid\; I need CANU_LOCAL_JOB_ID set, or a job index on the command line.
  exit
fi
if [ x$CANU_LOCAL_JOB_ID = x ]; then
  echo Running job $jobid based on command line options.
else
  echo Running job $jobid based on CANU_LOCAL_JOB_ID=$CANU_LOCAL_JOB_ID and offset=$offset.
fi

if [ $jobid -eq 1 ] ; then
  bat="001"
  job="001/000001"
  opt="-h 1-12098 -r 1-12098 --hashdatalen 80001727"
fi

if [ $jobid -eq 2 ] ; then
  bat="001"
  job="001/000002"
  opt="-h 12099-24200 -r 1-24200 --hashdatalen 80003173"
fi

if [ $jobid -eq 3 ] ; then
  bat="001"
  job="001/000003"
  opt="-h 24201-36270 -r 1-36270 --hashdatalen 80005073"
fi

if [ $jobid -eq 4 ] ; then
  bat="001"
  job="001/000004"
  opt="-h 36271-48308 -r 1-48308 --hashdatalen 80003205"
fi

if [ $jobid -eq 5 ] ; then
  bat="001"
  job="001/000005"
  opt="-h 48309-60351 -r 1-60351 --hashdatalen 80003383"
fi

if [ $jobid -eq 6 ] ; then
  bat="001"
  job="001/000006"
  opt="-h 60352-72389 -r 1-72389 --hashdatalen 80004198"
fi

if [ $jobid -eq 7 ] ; then
  bat="001"
  job="001/000007"
  opt="-h 72390-84428 -r 1-84428 --hashdatalen 80001891"
fi

if [ $jobid -eq 8 ] ; then
  bat="001"
  job="001/000008"
  opt="-h 84429-96506 -r 1-96506 --hashdatalen 80002360"
fi

if [ $jobid -eq 9 ] ; then
  bat="001"
  job="001/000009"
  opt="-h 96507-108567 -r 1-108567 --hashdatalen 80004633"
fi

if [ $jobid -eq 10 ] ; then
  bat="001"
  job="001/000010"
  opt="-h 108568-117521 -r 1-117521 --hashdatalen 59227486"
fi


if [ ! -d ./$bat ]; then
  mkdir ./$bat
fi


if [ -e $job.ovb ]; then
  exists=true
else
  exists=false
fi
if [ $exists = true ] ; then
  echo Job previously completed successfully.
  exit
fi

#  Fetch the frequent kmers, if needed.
if [ ! -e ../0-mercounts/asm.ms22.dump ] ; then
  mkdir -p ../0-mercounts
  cd ../0-mercounts
  cd -
fi


$bin/overlapInCore \
  -t 5 \
  -k 22 \
  -k ../0-mercounts/asm.ms22.dump \
  --hashbits 22 \
  --hashload 0.8 \
  --maxerate  0.01 \
  --minlength 500 \
  $opt \
  -o ./$job.ovb.WORKING \
  -s ./$job.stats \
  ../../asm.seqStore \
&& \
mv ./$job.ovb.WORKING ./$job.ovb


exit 0
