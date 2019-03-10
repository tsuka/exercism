package Word;

use strict;
use warnings;
use List::Util qw(sum);

my %scores;
BEGIN {
    my %scores_base =(
        "AEIOULNRST" => 1,
        "DG"         => 2,
        "BCMP"       => 3,
        "FHVWY"      => 4,
        "K"          => 5,
        "JX"         => 8,
        "QZ"         => 10
    );

    while (my ($letters, $score) = each(%scores_base)) {
        foreach my $letter (split(//, $letters)) {
            $scores{$letter} = $score;
        }
    }
}

sub new {
    my ($class, $word) = @_;
    return bless {word => uc($word)};
}

sub score {
    my $self = shift;
    return sum(grep {defined($_)} map {$scores{$_}} split(//, $self->{word})) // 0;
}
1;
