#!/usr/bin/perl
#this script cleans the importfile.csv of 
#uncommon spelling anamolies
use utf8;
use Encode;
#use unicode;
no warnings;
binmode STDOUT, ":encoding(utf8)";
while(<STDIN>){
@line=split /,/;
$tidied=&tidy($line[1]);
$novowels=&removevowels($tidied);
$abbreviated=&abbreviateTo3Letters($novowels);
$strictlynovowels=&removevowelsAndWY($tidied);
$wamj1vowel =&wellAlrightMaybeJustOneVowel($tidied);
print  "$line[0],$line[1],$tidied,$wamj1vowel,$novowels,$strictlynovowels, $abbreviated,xxxx,$line[2],$line[3]"
}


sub abbreviateTo3Letters {
$word=@_[0];

$start= substr $word,1, 2;
$end=  substr $word, -1, 1;
$word_length=length($word); 
if ($word_length>3) {$word = "$start$end$word_length"};
return $word}

sub removevowels {
$word=@_[0];
$word=~ s/([^ ])([aeiou][aeiou]*)/\1/g;
return $word;}

sub wellAlrightMaybeJustOneVowel {
$word=@_[0];
$old_word=$word;

#$word =~ s/([aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1/g;
#$old_word=~s/([aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2/g;
#$old_word=~s/[aeiou ][aeiou ]*//g;

#if ($word =~ s/([aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1/g)
#{$old_word=~s/([aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2/g;} else
#{$word =~ s/([^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1/g;
#$old_word=~s/([^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2/g;}

if ($word =~ s/( [aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1/g)
{$old_word=~s/( [aeiou][aeiou]*[^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2/g;} else
{$word =~ s/( [^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1/g;
$old_word=~s/( [^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2/g;}

#$word =~ s/( [^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\1\-\-/g;
#$old_word=~s/( [^aeiou][^aeiou]*[aeiou][aeiou]*)(.*)/\2\-\-\-\-/g;#}


$old_word=~s/[aeiou ][aeiou ]*//g;




return "$word$old_word";}

sub removevowelsAndWY {
$word=@_[0];
$word=~ s/([^ ])([aeiouyw][aeiouyw]*)/\1/g;
return $word;}


sub tidy {

$word=decode('UTF-8',@_[0]);
#up($word);
#$word=~ s/^[a-z]*,//g;
#$word=~ s/,[0-9]*,/,/g;
#$word=~ s/([^aeiou])\1/\1/g;
#$word=~ s/c/k/g;
#$word=~ s/\N{U+015B}/z/g;
$word=~ s/x/ks/g;
$word=~ s/[áéíóú]/u/g;
$word=~ s/τ/th/g;
#$word=~ s/[a-z]0//g;
#$word=~ s/[áéíóú]/c/g;
$word=~ s/â/ey/g;
$word=~ s/[êɥŏï]/iy/g;
$word=~ s/[ëöü]/uw/g;
#the following replaces vowels


#$word=~ s/[àèìòùħ]//g;

$word=~ s/\$/sh/g;
$word=~ s/î|a\;/uy/g;
$word=~ s/ŕ/r/g;
$word=~ s/ô|u\=/uw/g;

$word=~ s/û/yw/g;
$word=~ s/[ť¢]/ch/g;
$word=~ s/q/k/g;
#$word=~ s/q/k/g;
$word=~ s/ñ/ng/g;
$word=~ s/\{r0/r/g;
#$word=~ s/y\{r/YUR/g;
$word=~ s/y\{r/yr/g;

$word=~ s/[åø]/or/g;
$word=~ s/ā/ar/g;
$word=~ s/ő/u/g;
$word=~ s/õ/aw/g;
$word=~ s/ė/i/g;
$word=~ s/ōō/uu/g;
$word=~ s/ōū/uu/g;
$word=~ s/[ōū]/uu/g;
$word=~ s/ţ/sh/g;
$word=~ s/ś/z/g;
$word=~ s/ŝ/zj/g;
$word=~ s/ç/s/g;
#$word=~ s/u\//y/g;
$word=~ s/u\//u\*/g;

$word=~ s/ƒ/v/g;
$word=~ s/ĝ/j/g;
$word=~ s/þ/f/g;
$word=~ s/ð/t/g;
#$word=~ s/δ/j/g;
$word=~ s/ҭ/th/g;
$word=~ s/ŷ/uy/g;
$word=~ s/[ųμ]/i/g;
$word=~ s/ĭ/y/g;
$word=~ s/ã/e/g;
$word=~ s/ǔ/w/g;
#$word=~ s/ĕ/AE/g;
#$word=~ s/AE/ey/g;
#$word=~ s/EE/iy/g;
#$word=~ s/IE/ay/g;
#$word=~ s/OE/cw/g;
#$word=~ s/UE/yuw/g;
#$word=~ s/OR/oc/g;
#$word=~ s/OU/aw/g;
#$word=~ s/OO/uw/g;
#$word=~ s/AR/uc/g;
#$word=~ s/[Aa]/a/g;
#$word=~ s/[Ee]/e/g;
#$word=~ s/[Ii]/i/g;
#$word=~ s/[Oo]/o/g;
#$word=~ s/[Uu]/u/g;
#$word=~ s/\'/c/g;
$word=~ s/\'//g;
#$word=~ s/r\}/r/g;
#$word=~ s/\~/w/g;
#$word=~ s/y\{/yŕ/g;
#$word=~ s/w\^/v/g;
#$word=~ s/e\{/ŕ/g;
$word=~ s/ŕ\}/ŕ/g;
$word=~ s/\_/\-/g;
$word=~ s/\-0/\-/g;
#the following line replaces silent letters
$word=~ s/([a-z])0|[àèìòùħ]//g;

$word=~ s/R/r/g;
$word=~ s/[a-z]*\!//g;
return $word;}
 