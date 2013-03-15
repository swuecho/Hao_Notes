mongoDB notes
=======================

1. mongodb is case- and type sensitive.
2. can not contain duplicate keys.

admin command
-----------------
    1. mongorestore $dumped
    2. use $database
    3. show collections
    4. db : show current connected database

use command
------------------

Create
    post = json_object

Insert
    db.blog.insert(post)

Read
    db.blog.find() : read all the documentation in one collection

    db.blog.findOne() : read one ..

Update
    db.blog.update(old,new)

Remove
    db.blog.remove()


