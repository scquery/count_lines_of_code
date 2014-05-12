#!/usr/bin/perl
use strict;
my $file=shift;
open FH,"$file" or die $!;
my @cpp;
my @match;
while(<FH>)
{
chomp;

push @cpp,$_;
}
close FH;
find(\@cpp);
sub find{ 
  my $array=shift;
  my $begin=0;
  my $pos1;
  my $pos2;
  foreach my $temp (@$array){
  $begin+=1;
  if($temp=~m/\/\*/)
      {
        $pos1=$begin;
      }
  if($temp=~m/\*\//)
      { 
        $pos2=$begin;
        my $length=($pos2-$pos1)+1;
        splice(@$array,$pos1,$length);
        last;
      }
      }
   foreach my $temp2 (@$array){
   if($temp2=~m/\*\//)
     {
      find($array);   
      }
    }
     
}
=foreach my $line1(@cpp){
print "$line1\n";
}
=cut
my $mytotal=$#cpp;
foreach my $line(@cpp)
{
if($line!~/http:\/\//){
if($line=~m/\/\//)
{
push @match,$line;
}
}

if($line=~m/^\s*\/\//||$line=~/^\s*$/){
$mytotal--;
}
}
print "Below is the single note:\n";
foreach my $temp (@match)  
{
print "$temp\n";
}
print "For the CPP,There have $mytotal line \n";
