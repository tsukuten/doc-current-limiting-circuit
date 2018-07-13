#!/usr/bin/env perl
$latex = 'uplatex %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$bibtex = 'upbibtex -kanji=utf8 %O %B';
$bibtex_use = 2;  # Also clean .bbl files.
$pdf_mode = 3;  # Use dvipdf.
