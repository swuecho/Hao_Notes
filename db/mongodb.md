#this work

db.posts.aggregate(
    { $project : {
        "comments.author" : 1
    }},
    { $unwind : "$comments" },
    {$limit:5}
);
# this is not work
(syntax problems)

db.posts.aggregate(
    { $project : {
        comments.author : 1
    }},
    { $unwind : "$comments" },
    {$limit:5}
);


# how to make the above right
# hw5.1
db.posts.aggregate(
    { $project : {
        comments: 1   
    }},
    { $unwind : "$comments" },
    { $group : 
       {_id : "$comments.author",
	num_comments : {$sum : 1}
        }
    },
    {$sort: {num_comments: -1}},
    {$limit:1}
);


#hw5.2

db.zipcodes.aggregate(
	{ "$match" : {"$or" : [{"state" : "CA"},{"state" : "NY"}]}},
	{$group : 
		{"_id" : { "state" : "$state", "city": "$city"},
		  "pop": {$sum: "$pop"}}},
        { "$match" : { "pop" : { "$gte" : 25000}}},
        {$group: 
		{"_id" : null,
		 avgcitypop : { $avg :"$pop"}}}
        
)

#hw5.3
db.grades.aggregate(
 {"$unwind": "$scores"},
 {"$project":
    {"_id" :1 , "student": "$student_id", "class" : "$class_id",
    "score": "$scores.score", "type" : "$scores.type"}
 },
 { "$match" : {"type" : {"$ne" : "quiz"}}},
 {"$group":
   {"_id": {"class" : "$class",
            "student": "$student" },
    score_avg : {$avg : "$score"}}
 },
 {$group :
   {"_id": "$_id.class", avg_p: {$avg : "$score_avg"}}},
   
 {$sort : {"avg_p": -1}}
)


#hw5.4

db.zipcodes.aggregate(
     {$project: 
      { city :1,
        pop : 1 } 
    },
    { "$match" : {"city": /^[0-9]/}},
      {$group :
      {"_id": null, popu : {$sum : "$pop"}}}
 )

