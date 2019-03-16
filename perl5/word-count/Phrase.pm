package Phrase;

use strict;
use warnings;

sub word_count {
    my $phrase = shift;
    $phrase = lc($phrase);
    my %count;
    $count{$1} ++ while ($phrase =~ /(\w+)/g);
    return \%count;
}
1;
