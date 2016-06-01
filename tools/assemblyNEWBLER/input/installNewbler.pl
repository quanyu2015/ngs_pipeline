#!/usr/bin/env perl

use v5.18;
use strict;
use Getopt::Long;

GetOptions(
	'newbler=s' => \(my $newbler = '/data/DataAnalysis_2.9_All/packages/opt/454/apps/mapper/bin/runAssembly'),
	'cpu=i' => \(my $cpuCORES = 1),
	'ko=s' => \my $ko
)  or die "Invalid options passed to $0\n";

die "$0 requires the ko argument (--ko)\n" unless $ko;


`./installNewbler.sh`;

my $outputDIR   = "/data/$ko";

#Run newbler
my $pair1 = "$outputDIR/input/$ko.1.fq";
my $pair2 = "$outputDIR/input/$ko.2.fq";
system("$newbler -cpu $cpuCORES -force -m -urt -rip -o $outputDIR $pair1 $pair2");


