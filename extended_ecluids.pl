use strict;
use warnings;

my $input_line = <STDIN>;
chomp $input_line;

my ($M , $N) = split /\s+/, $input_line;
$N = $N % $M;
my ($a2,$a3,$b2,$b3) = (0,$M,1,$N);

#Extended Ecluids Algorithm:
while ($b3 > 1){
    use integer; #in the while scope
    my $Q = $a3 / $b3;
    ($a2,$a3,$b2,$b3) = ($b2 , $b3 , $a2-$Q*$b2 , $a3 % $b3);
}

if ($b3 == 1){
    my $additive_inv = $M - $N;
    my $mul_inv = $b2 % $M;
    print "$additive_inv $mul_inv\n";
}
else{
    print "IMPOSSIBLE\n";
}