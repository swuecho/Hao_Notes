* root to user
su - xxx，（xxx为普通用户名，其中-两端有空格，不要漏掉）

* tar

tar xvzf file-1.0.tar.gz - to uncompress a gzip tar file (.tgz or .tar.gz)
tar xvjf file-1.0.tar.bz2 - to uncompress a bzip2 tar file (.tbz or .tar.bz2)
tar xvf file-1.0.tar - to uncompressed tar file (.tar)

x = eXtract, this indicated an extraction c = create to create )
v = verbose (optional) the files with relative locations will be displayed.
z = gzip-ped; j = bzip2-zipped
f = from/to file ... (what is next after the f is the archive file)

## check binary file 
"hexdump -C yourfile.bin"

