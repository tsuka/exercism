package Proverb;

use strict;
use warnings;

sub proverb {
    my ($words, $qualifier) = @_;
    my $proverb = "";
    my $first = $qualifier ? 
        "$qualifier $words->[0]" : $words->[0];
    foreach my $i (0..scalar(@$words)-2) {
        my ($word1, $word2) = @$words[$i..$i+1];
        $proverb .=  "For want of a $word1 the $word2 was lost.\n";
    }
    $proverb .= "And all for the want of a $first.";
    return $proverb;
}
1;
