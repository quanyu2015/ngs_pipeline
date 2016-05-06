#!/usr/bin/env perl
# process fastq files
# Illumina pipeline 1.4 to pipline 1.9

# my $a = shift;
my $rd = shift;
# open my $in, "<", $a;
# open my $in, "<", "../input/test.fq";
#         while(<$in>)
	while(<STDIN>)
        {
        # m/^(\@HWI\S+) ([1-2])/ ? say $out "$1\/$2" : print $out $_
        m/^(\@HWI\S+) ([1-2])/ ? print "$1#0\/$rd\n" : print $_;
        }
#       close $in;
