package Bencher::Scenario::CompleteArrayElem;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    participants => [
        {
            name => 'charmode-1000',
            module => 'Complete::Util',
            code => sub {
                state $ary = do {
                    my $ary = [];
                    for my $l1 (0..9) {
                        for my $l2 (0..9) {
                            for my $l3 (0..9) {
                                push @$ary, "aaa${l1}bbb${l2}ccc${l3}";
                            }
                        }
                    }
                    $ary;
                };
                Complete::Util::complete_array_elem(
                    word  => 'a9b9c9',
                    array => $ary,
                );
            },
        },
    ],
    #datasets => [
    #],
};

1;
# ABSTRACT: Benchmark complete_array_elem()

=head1 SYNOPSIS
