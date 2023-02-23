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




/home/inf-38-2022/anaconda3/envs/longread/bin/meryl -C k=22 threads=4 memory=12 \
  count segment=1/01 ../../asm.seqStore \
> asm.ms22.config.01.out 2>&1
/home/inf-38-2022/anaconda3/envs/longread/bin/meryl -C k=22 threads=4 memory=12 \
  count segment=1/02 ../../asm.seqStore \
> asm.ms22.config.02.out 2>&1
/home/inf-38-2022/anaconda3/envs/longread/bin/meryl -C k=22 threads=4 memory=12 \
  count segment=1/04 ../../asm.seqStore \
> asm.ms22.config.04.out 2>&1
/home/inf-38-2022/anaconda3/envs/longread/bin/meryl -C k=22 threads=4 memory=12 \
  count segment=1/06 ../../asm.seqStore \
> asm.ms22.config.06.out 2>&1
/home/inf-38-2022/anaconda3/envs/longread/bin/meryl -C k=22 threads=4 memory=12 \
  count segment=1/08 ../../asm.seqStore \
> asm.ms22.config.08.out 2>&1
exit 0
