package Phrase;

use strict;
use warnings;

sub word_count {
    my $phrase = shift;
    $phrase = lc($phrase);
    my $count = {};
    while ($phrase =~ /(\w+)/g) {
        $count->{$1} ++;
    }
    return $count;
}
1;
