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

if [ $jobid = 1 ] ; then
  minid=1
  maxid=11619
fi
if [ $jobid = 2 ] ; then
  minid=11620
  maxid=23249
fi
if [ $jobid = 3 ] ; then
  minid=23250
  maxid=34838
fi
if [ $jobid = 4 ] ; then
  minid=34839
  maxid=46408
fi
if [ $jobid = 5 ] ; then
  minid=46409
  maxid=57986
fi
if [ $jobid = 6 ] ; then
  minid=57987
  maxid=69545
fi
if [ $jobid = 7 ] ; then
  minid=69546
  maxid=81111
fi
if [ $jobid = 8 ] ; then
  minid=81112
  maxid=92699
fi
if [ $jobid = 9 ] ; then
  minid=92700
  maxid=104297
fi
if [ $jobid = 10 ] ; then
  minid=104298
  maxid=115902
fi
if [ $jobid = 11 ] ; then
  minid=115903
  maxid=117521
fi
jobid=`printf %05d $jobid`

if [ -e ./$jobid.red ] ; then
  echo Job previously completed successfully.
  exit
fi

$bin/findErrors \
  -S ../../asm.seqStore \
  -O ../asm.ovlStore \
  -R $minid $maxid \
  -e 0.01 \
  -l 500 \
  -m 0.003 \
  -s \
  -p 5 \
  -o ./$jobid.red.WORKING \
  -t 4 \
&& \
mv ./$jobid.red.WORKING ./$jobid.red


