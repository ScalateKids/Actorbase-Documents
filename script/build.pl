#!/usr/bin/perl
#
# build
# Perl script to clean out compile output during pdf generation from LaTeX file
# Author: Andrea Giacomo Baldan
# Version: 2.0

use strict;
use warnings;
use threads;
use threads::shared;
use File::Find;
use open qw/:std :utf8/;

my %logs :shared;
my $count :shared = 0;
our @threads;
our $total = 0;

print "\n";
finddepth({wanted => \&list_files, no_chdir => 1}, '.');

sub list_files {
    if( -f $_ && $_ =~ m/\.tex$/ ) {
        my $thr = threads->create(\&compile_tex, $_);
        push @threads, $thr;
        $total++;
    }
}

sub compile_tex {
    my ($tex) = @_;
    my $point = 50 - length $tex;
    my $result = qx/pdflatex -halt-on-error -file-line-error $tex 2>&1/;
    if($? != 0) {
        lock(%logs);
        $logs{$tex} = $result;
        print "\e[1m [0/2] $tex" . "." x $point . "\e[31mERROR\e[0m\n";
    } else {
        $result = qx/pdflatex -halt-on-error -file-line-error $tex 2>&1/;
        print "\e[1m [2/2] $tex" . "." x $point ."\e[32mOK\e[0m\n";
        lock($count);
        $count++;
    }
}

$_->join() foreach(@threads);
printf "\n\e[1m [*] Succesfully compiled %d out of %d. Completed...[%d%%]\e[0m", $count, $total, ($count / $total) * 100;
system('rm -f *.log *.aux *.out *.lof *.lot *.soc *.toc');
if(%logs) {
    my $log = "\e[1m [!] ERROR REPORT\e[0m\n";
    foreach(keys %logs) {
        $log .= "\n\e[1m [*] " . $_ . "\n\n\e[0m";
        my @matches = $logs{$_} =~ /(Error:|Missing:|Warning:)(.*?)(?=[.;]\s+)/gs;
        my @u_sequence = $logs{$_} =~ /(\d+:\s*)(Undefined control sequence|LaTeX Error:)/gs;
        push @matches, reverse @u_sequence;
        foreach(@matches) {
            if($_ =~ s/(Error:|Undefined control sequence|LaTeX Error:)/\e[1m\e[31m$1\e[0m/g ||
                $_ =~ s/(Warning:|Missing:)/\e[1m\e[33m$1\e[0m/g) {
                $log .= "   " . $_;
            } elsif ($_ =~ s/(\d+)(\:)/At line $1/g) {
                $log .= "\e[31m:\e[0m   " . $_ . "\n";
            } else {
                $_ =~ s/\s+/ /g;
                $log .= join("", split("\n", $_)) . "\n";
            }
        }
    }
    print "\n\n" . $log . "\e[0m\n\n";
}
