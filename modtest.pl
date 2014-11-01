#!/usr/bin/perl
# vim:ts=4:sw=4:si:fdm=marker:tw=100:ruler

use strict;
use warnings;
use Module::Load::Conditional;

if (can_load(modules => 

my $have_iopri = eval
{
	use Linux::IO_Prio qw(:all);
	my $status = ioprio_set(IOPRIO_WHO_PROCESS, $$,
		IOPRIO_PRIO_VALUE(IOPRIO_CLASS_IDLE, 0));
	my $status = ionice(IOPRIO_WHO_PROCESS, $$, IOPRIO_CLASS_IDLE, 0);
	print "whee\n";
	1;
}
print "We have Linux_IO_Prio\n" if ($have_iopri);
