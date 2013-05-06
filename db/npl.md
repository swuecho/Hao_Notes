# Natural language processing

Unixt tools

---

* tr

Basic usage:

    tr [options] "set1" "set2"
    echo something | tr "set1" "set2"
    tr "set1" "set2" < input.txt
    tr "set1" "set2" < input.txt > output.txt

Create a list of the words in /path/to/file, one per line, enter:

    $ tr -cs "[:alpha:]" "\n"  <  /path/to/file

Where

* -c : Complement the set of characters in string1


* -s : Replace each input sequence of a repeated character that is listed in SET1 with a single occurrence of that character



