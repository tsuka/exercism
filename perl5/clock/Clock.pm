package Clock;
use strict;
use warnings;

use constant MINUTE_PER_DAY => 24 * 60;

sub new {
  my ($class, $attributes) = @_;
  my ($hour, $minute) = ($attributes->{hour}, $attributes->{minute});
  return bless {minute=>($hour*60+$minute) % MINUTE_PER_DAY}, $class;
}

sub time {
  my ($self) = @_;
  my $minute = $self->{minute};
  return sprintf("%02d:%02d", $minute / 60, $minute % 60);
}

sub add_minutes {
  my ($self, $amount) = @_;
  $self->{minute} = ($self->{minute} + $amount) % MINUTE_PER_DAY;
  return $self;
}

sub subtract_minutes {
  my ($self, $amount) = @_;
  $self->{minute} = ($self->{minute} - $amount) % MINUTE_PER_DAY;
  return $self;
}

1;
