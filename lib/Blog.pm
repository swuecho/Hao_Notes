package Blog;
use Dancer2 ':syntax';
use Blog::Post;
use Dancer2::Session::MongoDB;
use User;
use Carp;
use Fun;

prefix '/post' => sub {
    get '/:permalink' => sub {
        my $permalink = params('perlmalink');
        my $post = find_post_by_permalink($permalink);
        return redirect '/error_page' unless $post;
        my $new_comment = { name  => '',
                            email =>'',
                            body  => ''};
        return template ' ', {};
    };

    post '/login' => sub {
        my $user = validate_login(params->{user},params->{password});               if ($user) {
            # session name => $name; 
            # session
        }
    };


    get '/signup' => sub {
        my $email = params('email');
        my $username = params('username');
        my $password = params('password');
        my $verify   = params('verify');
        if (validate_signup($email,$username,$password,$verify)) {
           if (not add_user($username,$email,$password)) {
                carp "user name already in use";
             } else {
             # good user, start a new session 
                # set session
                session username => $username;
            }
        } 
    };
    get '/newpost' => sub { 
        my $username = session('username');
        if ($username) {
                return ;   
            } else {
                 redirect("/login");
            }
        };
        


};

true;
