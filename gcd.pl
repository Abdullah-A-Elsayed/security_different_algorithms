use strict;
use warnings;

my $input_line = <STDIN>;
chomp $input_line;

my ($n1 , $n2) = split /\s+/, $input_line;

if ($n1 < $n2){
    ($n1 , $n2) = ($n2 , $n1);
}
#Ecluids Algorithm:
while ($n2 != 0){
    ($n1 , $n2) = ($n2 , $n1 % $n2);
}
print $n1."\n";