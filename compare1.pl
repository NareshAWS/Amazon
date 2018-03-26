#!/usr/bin/perl


use strict;
use warnings;
use Data::Dumper;
our %hash = ();
my $firstFile  = $ARGV[0];
my $secondFile = $ARGV[1];
#my $BackFile = $ARGV[2];
my $pwd = `pwd`;
chomp($pwd);

my $Match = "$pwd/Match22.txt"; #-$time";
#print "Output filename=$outfilename\n";
my $UnMatch = "$pwd/UnMatch22.txt";
open MATCH, "> $Match" or die "could not open first file...\n";
open UNMATCH, "> $UnMatch" or die "could not open first file...\n";
open FIRST, "< $firstFile" or die "could not open first file...\n";
while (my $line = <FIRST>) {
                chomp($line);
        my @elements = split '\|', $line;
        my $esid = $elements[0];
      #  print "$esid \n";
                $hash{$esid} = $elements[0];   #store all the esid's in a hash
}
close FIRST;

#open BACKFILL, "< $outfilename" or die "could not open backfill file...\n";
open SECOND, "< $secondFile" or die "could not open second file...\n";
while (my $line = <SECOND>) {
 chomp($line);
                my @elements = split '\|', $line;
                my $esid= $elements[3];  # Perl arrays are zero-indexed
               #  print "$esid:\n";
                if ($hash{$esid}) {
                        #print "$col3Val Matches \n";
                        print MATCH "$line\n";
                }
                else {
                        #print "$col3Val NOT_Matched \n";
                        print  UNMATCH "$line\n";
                }
}

close SECOND;
close UNMATCH;
close MATCH;

