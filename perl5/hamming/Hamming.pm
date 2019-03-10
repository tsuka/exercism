package Hamming;
use strict;
use warnings;
use List::Util qw/min/;
use Exporter 'import';
our @EXPORT_OK = qw(hamming_distance);

sub hamming_distance {
  my ($strand1, $strand2) = @_;
  my $len = min(length($strand1), length($strand2));
  my $distance = 0;
  for my $i (0..($len-1)) {
    $distance++ if substr($strand1, $i ,1) ne substr($strand2, $i, 1);
  }
  return $distance;
}

1;
