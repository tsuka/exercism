# Declare package 'Bob'
package Bob;
use strict;
use warnings;
use Exporter 'import';
our @EXPORT_OK = qw(hey);

sub hey {
  my ($msg) = @_;
  return "Fine. Be that way!" if $msg =~ /\A\s*\Z/;
  return "Calm down, I know what I'm doing!" if $msg =~ /\A[A-Z ]+\?\Z/;
  return "Whoa, chill out!" if $msg !~ /[a-z]/ && $msg =~ /[A-Z]/;
  return "Sure." if $msg =~ /\?\s*\Z/;
  return "Whatever.";
}

1;
