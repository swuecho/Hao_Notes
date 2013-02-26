sub index($path){
 if $path.IO ~~ :f  {
	say "$path";
 } else {
	unless $path ~~ /'.'git/ {
	index($path~'/'~$_) for dir($path);
	}

	} 

}

index('/home/echo/notes');
