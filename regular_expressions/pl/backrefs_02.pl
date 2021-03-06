#!/usr/bin/perl

#######################################################
## Examples of groups and backreferences and
## special variables $1, $2, $3, etc in the list context.
##
## bugs to vladimir dot kulyukin at gmail dot com
#######################################################

use strict;
use warnings;

my $txt_01 = '1+1=2';

## PL groups are specified with special characters ().
## Corresponding text segments are retrieved with special
## variables $1, $2, $3, etc. Generally speaking, these
## variables are aligned with left parentheses. In other
## words, $1 is aligned with the 1st left parenthesis,
## $2 is aligned with the 2nd left parenthesis, etc.

## Example 01
## Suppose we match /(\d)\+(\d)\=(\d)/ against $txt_01.
## Then the variable alignment is as follows:
## /(\d)\+(\d)\=(\d)/
##  $1    $2    $3
## In other words, $1 is bound to '1',
## $2 is bound to '2' and $3 is bound to '3'.

## Output is:
## Example 01
## $ex_01_m01 -> 1
## $ex_01_m02 -> 1
## $ex_01_m03 -> 2

print "\nExample 01\n";
## in the list context =~ returns a list of matches that
## can be placed into scalar variables.
my ($ex_01_m01, $ex_01_m02, $ex_01_m03) = $txt_01 =~ /(\d)\+(\d)\=(\d)/;
print "\$ex_01_m01 -> $ex_01_m01\n\$ex_01_m02 -> $ex_01_m02\n\$ex_01_m03 -> $ex_01_m03\n"; 

## Example 02
## Suppose we match /((\d)\+(\d)\=(\d))/ against $txt_01.
## Then the special variable alignment is:
##  /((\d)\+(\d)=(\d))/;
##  $1$2    $3   $4
## In other words, $1 is bound to '1+1=2',
## $2 is bound to '1' and $3 is bound to '1',
## $4 is bound to '2'.

## Output is:
## Example 02
## $ex_02_m01 -> 1+1=2
## $ex_02_m02 -> 1
## $ex_02_m03 -> 1
## $ex_02_m04 -> 2

print "\nExample 02\n";
my ($ex_02_m01, $ex_02_m02, $ex_02_m03, $ex_02_m04) = $txt_01 =~ /((\d)\+(\d)=(\d))/;
print "\$ex_02_m01 -> $ex_02_m01\n\$ex_02_m02 -> $ex_02_m02\n";
print "\$ex_02_m03 -> $3\n\$ex_02_m04 -> $ex_02_m04\n"; 

## Example 03
## Suppose we match ((\d)\+(\d))=(\d) against $txt_01.
## Then the special variable alignment is:
##  /((\d)\+(\d))=(\d)$/
##  $1$2    $3    $4
## In other words, $1 is bound to '1+1',
## $2 is bound to '1' and $3 is bound to '1',
## $4 is bound to '2'.

## Output is:
## Example 03
## $ex_03_m01 -> 1+1
## $ex_03_m02 -> 1
## $ex_03_m03 -> 1
## $ex_03_m04 -> 2

print "\nExample 03\n";
my ($ex_03_m01, $ex_03_m02, $ex_03_m03, $ex_03_m04) = $txt_01 =~ /((\d)\+(\d))=(\d)$/;
print "\$ex_03_m01 -> $ex_03_m01\n\$ex_03_m02 -> $ex_03_m02\n";
print "\$ex_03_m03 -> $3\n\$ex_03_m04 -> $ex_03_m04\n"; 

