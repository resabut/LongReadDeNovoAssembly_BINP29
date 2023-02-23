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





/home/inf-38-2022/anaconda3/envs/longread/bin/sqStoreCreate \
  -o ./asm.seqStore.BUILDING \
  -minlength 1000 \
  -genomesize 12100000 \
  -coverage   200 \
  -bias       0 \
  -homopolycompress \
  -raw -trimmed -pacbio-hifi SRR13577846 /home/inf-38-2022/BINP29/longread/2/Data/Raw_reads/SRR13577846.fastq \
&& \
mv ./asm.seqStore.BUILDING ./asm.seqStore \
&& \
exit 0

exit 1
