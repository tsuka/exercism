package Grains;
use strict;
use warnings;
use Math::BigInt;
use Exporter 'import';
our @EXPORT_OK = qw(grains_on_square total_grains);

sub grains_on_square {
  my ($square) = @_;
  die "square must be between 1 and 64" if $square < 1 || $square > 64;
  return Math::BigInt->new(2)**($square-1);
}

sub total_grains {
  my $total = Math::BigInt->new(0);
  for my $n (1..64) {
    $total += grains_on_square($n);
  }
  return $total;
}

1;
