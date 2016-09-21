#!/usr/bin/perl
use strict;
use warnings;

main(@ARGV);

sub main
{
    message("This is the template.pl exercise file from Perl 5 Essential Training.");
}

sub message
{
    my $m = shift or return;
    print("$m\n");
}

sub error
{
    my $e = shift || 'unkown error';
    print("$0: $e\n");
    exit 0;
}

sub currentTime {
    # Return timestamp like this: 2010-Jun-05 18:31:28
    my $t = time;
    my @months = qw(Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec);
    my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime($t);
    $year += 1900;
    $mday = '0' . $mday if ($mday <10);
    $hour = '0' . $hour if ($hour <10);
    $min = '0' . $min if ($min <10);
    $sec = '0' . $sec if ($sec <10); 
    return "$year-$months[$mon]-$mday $hour:$min:$sec ";
}
