package Raindrops;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(raindrop);

sub raindrop {
  my ($number) = @_;
  my $result = "";
  $result .= "Pling" if $number % 3 == 0;
  $result .= "Plang" if $number % 5 == 0;
  $result .= "Plong" if $number % 7 == 0;
  return $result || $number;
}

1;
