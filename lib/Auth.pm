use Dancer2;
use Dancer2::Session::MongoDB;
use User;

get '/login' => sub {
    return template 'auth/login.tt';
};

get '/signup' => sub {
    return template 'auth/signup.tt';
};

post '/signup' => sub {
    my $username = param 'username';
    my $password = param 'password';
    my $id = add_user($username,$password);
    if (not $id) { warn 'duplicated username!'}
    redirect 'login';
};

post '/login' => sub {
    my $username = param 'username';
    my $password = param 'password';
    my $user = validate_login($username,$password);
    if ($user) {
                session username => $user->{_id};
                redirect '/'; 
    } else {
        redirect '/login';
    }
    };

get '/logout' => sub {
        my $id = session->id;
        context->destroy_session;
        return $id;
 };


get '/' => sub {
# if  user is present in the session, let him go, otherwise redirect to
# /login
      if (not session('username')) {
            redirect '/login';
        }
      return template 'home.tt';  

    };


1;
