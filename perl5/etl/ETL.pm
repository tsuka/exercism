package ETL;
    sub transform {
        my $orig = shift;
        my $result = {};
        while (my ($key, $value) = each(%$orig)) {
            foreach my $letter (@$value) {
                $result->{lc($letter)} = $key;
            }
        }
        return $result;
    }
1;
