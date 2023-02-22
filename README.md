# LongReadDeNovoAssembly_BINP29

# install
## git
.gitignore

    /Data

## Download data
[Reads](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR13577846&display=download) 
Download the fastqc and unzip it
```bash
gunzip 
```

It is a dataset containing HiFi Pacbio reads from the yeast *Saccharomyces cerevisiae*


to make read-only the data directory
```bash
chmod a=r Data/
```

# conda env
```bash
conda create -n longread
conda activate longread
conda install sra-tools=
conds
```