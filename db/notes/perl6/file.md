# File operation in perl6

## special variables;

$*IN = STDIN


## the easy way

### slurp and spit

```perl

$sring = slurp $filename;
@lines = slurp $filename;
```

## the normal way

the following two are equal
```perl
my $fh =open $filename ;

my $fh2 = open $filename, :r ;

my $fh3 = open($filename, :r, :encoding<UTF-8>);
```
:r for reading
:w for writing
:a for appending

## the OO way
```perl
my @all = $filename.IO.lines;
say @all.elems;
```
* get 

get a line from a file handle

* @lines = $fh.lines

store the files in the list @line

## write to file handle
```perl
$fh.say("write to file handle")
```

## useful function when working with file

* words

get the list of words in line;


# file test
```perl
if '/etc/passwd'.IO ~~ :e { say "exists" }
```

* :e
* :d
* :f
* :r
* :w
* :x

* :z
* :s

```perl
mkdir 'dirname';
rmdir 'dirname';
chdir 'dirname';

unlink
chmod
chown
```



    
