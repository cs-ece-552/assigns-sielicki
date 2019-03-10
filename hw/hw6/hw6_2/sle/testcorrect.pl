#!/usr/bin/env perl
use strict;
use warnings;

use File::Copy;

my $testdir = "./";

sub main {

    my @files = glob "./sle_*.asm";
    foreach my $file (@files) {
        mkdir ($file . "_attest") or die $!;
        chdir ("./" . $file . "_attest");
        copy  ("../" . $file, ".");
        system ("/u/s/i/sinclair/courses/cs552/spring2019/handouts/bins/assemble.sh", $file);
        system ("/u/s/i/sinclair/courses/cs552/spring2019/handouts/bins/wiscalculator", "./loadfile_all.img");
        copy  ("./archsim.trace", $file . "_testlog_concat");
        open   (my $appendlog, '>>', $file . "_testlog_concat");
        print $appendlog `head -n1 ${file}`;
        print $appendlog `tail -n1 ${file}`;
        close $appendlog;
        chdir ("../");
    }
}

main();





