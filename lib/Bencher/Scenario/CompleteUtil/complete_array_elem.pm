package Bencher::Scenario::CompleteUtil::complete_array_elem;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

our $scenario = {
    summary => 'Benchmark complete_array_elem()',
    modules => {
        'Complete::Util' => {version=>0.57},
        'Text::Levenshtein::XS' => {version=>0},
        'Text::Levenshtein::Flexible' => {version=>0},
    },
    participants => [
        {
            name => 'prefix-noci-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 (0..9) {
                        for my $l2 (0..9) {
                            for my $l3 (0..9) {
                                push @$ary, "aaa${l1}bbb${l2}ccc${l3}"; # 12char
                            }
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_CI = 0;
                local $Complete::Common::OPT_MAP_CASE = 0;
                #local $Complete::Common::OPT_WORD_MODE = 0; # should not been used, because normal prefix matching returns result
                #local $Complete::Common::OPT_CHAR_MODE = 0; # should not been used, because normal prefix matching returns result
                #local $Complete::Common::OPT_FUZZY     = 0; # should not been used, because normal prefix matching returns result
                Complete::Util::complete_array_elem(
                    word  => 'aaa9bbb9ccc9',
                    array => $ary,
                );
            },
        },
        {
            name => 'prefix-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 (0..9) {
                        for my $l2 (0..9) {
                            for my $l3 (0..9) {
                                push @$ary, "aaa${l1}bbb${l2}ccc${l3}"; # 12char
                            }
                        }
                    }
                    $ary;
                };
                #local $Complete::Common::OPT_WORD_MODE = 0; # should not been used, because normal prefix matching returns result
                #local $Complete::Common::OPT_CHAR_MODE = 0; # should not been used, because normal prefix matching returns result
                #local $Complete::Common::OPT_FUZZY     = 0; # should not been used, because normal prefix matching returns result
                Complete::Util::complete_array_elem(
                    word  => 'aaa9bbb9ccc9',
                    array => $ary,
                );
            },
        },

        # note that wordmode, charmode, and fuzzy also does prefix matching

        {
            name => 'wordmode-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 ('a'..'j') {
                        for my $l2 ('a'..'j') {
                            for my $l3 ('a'..'j') {
                                push @$ary, ($l1 x 3).'-'.($l2 x 3).'-'.($l3 x 3); # 12char
                            }
                        }
                    }
                    $ary;
                };
                #local $Complete::Common::OPT_WORD_MODE = 0;
                #local $Complete::Common::OPT_CHAR_MODE = 0; # should not been used, because normal prefix matching returns result
                #local $Complete::Common::OPT_FUZZY     = 0; # should not been used, because normal prefix matching returns result
                Complete::Util::complete_array_elem(
                    word  => 'j-j-j',
                    array => $ary,
                );
            },
        },
        {
            name => 'charmode-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 (0..9) {
                        for my $l2 (0..9) {
                            for my $l3 (0..9) {
                                push @$ary, "aaa${l1}bbb${l2}ccc${l3}"; # 12char
                            }
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_WORD_MODE = 0;
                #local $Complete::Common::OPT_CHAR_MODE = 0;
                #local $Complete::Common::OPT_FUZZY     = 0; # should not been used, because char-mode returns result
                Complete::Util::complete_array_elem(
                    word  => 'a9b9c9',
                    array => $ary,
                );
            },
        },
        {
            name => 'fuzzy-xs-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 ('a'..'j') {
                        for my $l2 ('a'..'j') {
                            for my $l3 ('a'..'j') {
                                push @$ary, ($l1 x 4).($l2 x 4).($l3 x 4); # 12char
                            }
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_WORD_MODE = 0;
                local $Complete::Common::OPT_CHAR_MODE = 0;
                undef $Complete::Util::code_editdist;
                local $ENV{COMPLETE_UTIL_LEVENSHTEIN} = 'xs';
                Complete::Util::complete_array_elem(
                    word  => 'jjjjkjjjjjjj',
                    array => $ary,
                );
            },
        },
        {
            name => 'fuzzy-flex-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 ('a'..'j') {
                        for my $l2 ('a'..'j') {
                            for my $l3 ('a'..'j') {
                                push @$ary, ($l1 x 4).($l2 x 4).($l3 x 4); # 12char
                            }
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_WORD_MODE = 0;
                local $Complete::Common::OPT_CHAR_MODE = 0;
                undef $Complete::Util::code_editdist;
                local $ENV{COMPLETE_UTIL_LEVENSHTEIN} = 'flexible';
                Complete::Util::complete_array_elem(
                    word  => 'jjjjkjjjjjjj',
                    array => $ary,
                );
            },
        },
        {
            name => 'fuzzy-pp-1000',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 ('a'..'j') {
                        for my $l2 ('a'..'j') {
                            for my $l3 ('a'..'j') {
                                push @$ary, ($l1 x 4).($l2 x 4).($l3 x 4); # 12char
                            }
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_WORD_MODE = 0;
                local $Complete::Common::OPT_CHAR_MODE = 0;
                undef $Complete::Util::code_editdist;
                local $ENV{COMPLETE_UTIL_LEVENSHTEIN} = 'pp';
                Complete::Util::complete_array_elem(
                    word  => 'jjjjkjjjjjjj',
                    array => $ary,
                );
            },
        },
        {
            name => 'fuzzy-pp-100',
            code => sub {
                state $ary = do {
                    require Complete::Util;
                    my $ary = [];
                    for my $l1 ('a'..'j') {
                        for my $l2 ('a'..'j') {
                            push @$ary, ($l1 x 6).($l2 x 6); # 12char
                        }
                    }
                    $ary;
                };
                local $Complete::Common::OPT_WORD_MODE = 0;
                local $Complete::Common::OPT_CHAR_MODE = 0;
                undef $Complete::Util::code_editdist;
                local $ENV{COMPLETE_UTIL_LEVENSHTEIN} = 'pp';
                Complete::Util::complete_array_elem(
                    word  => 'jjjjjkjjjjj',
                    array => $ary,
                );
            },
        },
    ],
    #datasets => [
    #],
};

1;
# ABSTRACT:
