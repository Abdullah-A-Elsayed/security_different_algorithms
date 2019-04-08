use strict;
use warnings;

my $input_line = <STDIN>;
chomp $input_line;

my ($N , $P , $M) = split /\s+/, $input_line;
$N %= $M;

# my $P_bin = sprintf("%b",$P); --> bad range
my ($P_bin, $t) = ("" , $P);

while ($t>0){
    print $t."  loop in\n";
    $P_bin = ($t%2).$P_bin;
    use integer;
    $t = $t >> 1;
    print $t."  loop out\n";
}
print $P_bin."\n";
exit;
my $R = $N;
for (my $i=1 ; $i< length($P_bin); $i++){
    $R *= $R;
    if ((substr $P_bin, $i , 1) == "1"){
        $R *= $N;
    }
    $R %= $M;
}
print $R."\n";