package Blog;
use Dancer2 ':syntax';
use Blog::Post;
use Session;
use User;
use Carp;
use Fun;

fun get_session_cookie($request) {
        if (request.raw().getCookies() == null) {
            return null;
        }
        for (Cookie cookie : request.raw().getCookies()) {
            if (cookie.getName().equals("session")) {
                return cookie.getValue();
            }
        }
        return null;
}

fun getSessionCookieActual(final Request request) {
        if (request.raw().getCookies() == null) {
            return null;
        }
        for (Cookie cookie : request.raw().getCookies()) {
            if (cookie.getName().equals("session")) {
                return cookie;
            }
        }
        return null;
    }
fun extractTags($tags) {

}
fun validateSignup($username, $password,$verify,$email) {
        my $user_re = "^[a-zA-Z0-9_-]{3,20}$";
        my $password = "^.{3,20}$";
        my $email = "^[\S]+@[\S]+\.[\S]+$";

        if (!username.matches(USER_RE)) {
            errors.put("username_error", "invalid username. try just letters and numbers");
            return false;
        }

        if (!password.matches(PASS_RE)) {
            errors.put("password_error", "invalid password.");
            return false;
        }


        if (!password.equals(verify)) {
            errors.put("verify_error", "password must match");
            return false;
        }

        if (!email.equals("")) {
            if (!email.matches(EMAIL_RE)) {
                errors.put("email_error", "Invalid Email Address");
                return false;
            }
        }

        return true;
    }


#NOTES: Read all the document from in the class hierarchy
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
                my $session_id  = start_session($username);
                my $cookie = Dancer2::Cookie->new(name => "session",value => $session_id);
                #TODO: add cookie to context???
                redirect("/welcome"); 
            }
        } 
    };
    get '/newpost' => sub { 
        my $username = find_user_name_by_session_id(get_session_cookie(request)); ## TODO
        if ($username) {
                return ;   
            } else {
                 redirect("/login");
            }
        };
        


};

true;
