use strict;
use warnings;

my $input_line = <STDIN>;
chomp $input_line;

my ($M , $N) = split /\s+/, $input_line;
my $addition = &Add_hexas($M,$N);
my $mul = &Mul_hexas($M,$N);
print $addition." ".$mul."\n";

sub Add_hexas(){
    my ($M , $N) = @_ ;
    ($M , $N) = (hex $M , hex $N);
    my $max_len = 2;
    my $r = sprintf("%0${max_len}X" , ($M ^ $N));
    return $r;
}

sub Mul_hexas(){
    my ($A , $B) = @_ ;
    my $M  = "1B";
    ($A , $B , $M) = (hex $A , hex $B , hex $M);
    if ($A < $B){
        ($A , $B) = ($B , $A);
    }
    my @Muls = (0,$A);
    my ($i, $temp, $temp2) = (2,$A, $A);

    while ($i<=$B){
        $temp2 = ($temp << 1 ) & (hex "FF");
        if($temp2 < $temp){
            $temp2 = $temp2 ^ $M;
        }
        $temp = $temp2;
        push @Muls, $temp;
        $i = $i * 2 ;
    }
    my $B_bin = sprintf("%b",$B);
    my ($j , $max) = (1 , length($B_bin));
    my $r = 0;
    while($j<=$max){
        if ( (substr $B_bin, $max-$j , 1 ) == "1"){
            $r = $r ^ $Muls[$j];
        }
        $j = $j+1;
    }
    my $max_len = 2;
    $r = sprintf("%0${max_len}X" , $r);
    # 
    # print((join "\n", @Muls ), "\n");
    # 
    return $r;
}