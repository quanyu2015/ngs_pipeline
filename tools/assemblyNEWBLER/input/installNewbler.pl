#/usr/bin/env perl
#Script for docker


system('cd /data \
    tar -xzf DataAnalysis_*.tgz \
    cd /data/DataAnalysis*/packages/ \
    for file in gsSeqTools*x86_64.rpm gsNewbler*x86_64.rpm ;do rpm2cpio $file | cpio -idmv ; done')

#./DataAnalysis_2.9_All/packages/opt/454/apps/mapper/bin/runAssembly
