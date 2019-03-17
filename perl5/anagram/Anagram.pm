package Anagram;

use strict;
use warnings;

sub match {
    my ($word, @words) = @_;
    my $sorted = join("", sort(split("", lc($word))));
    my @matched = grep {
        my $sorted_candidate = join("", sort(split("", lc($_))));
        $word ne $_ && $sorted eq $sorted_candidate;
    } @words;
    return \@matched;
}
1;
