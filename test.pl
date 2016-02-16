#!/usr/bin/perl
# vim:ts=4:sw=4:si:fdm=marker:tw=100:ruler

use strict;
use warnings;
use Getopt::Long;

my $verbose = undef;

Getopt::Long::Configure ("bundling");
my $result = GetOptions (
	"v+" => \$verbose,
);

print "verbose is $verbose\n";
exit;
