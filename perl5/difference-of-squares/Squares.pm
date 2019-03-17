package Squares;

use strict;
use warnings;

use List::Util qw/sum/;

sub new {
  my ($class, $num) = @_;
  return bless { num => $num }, $class;
}

sub square_of_sum {
  my $self = shift;
  return sum(1..$self->{num}) ** 2;
}

sub sum_of_squares {
  my $self = shift;
  return sum(map {$_ ** 2} 1..$self->{num});
}

sub difference {
  my $self = shift;
  return $self->square_of_sum - $self->sum_of_squares;
}

1;
