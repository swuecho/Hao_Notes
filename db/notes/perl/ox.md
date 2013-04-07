route '/' => 'root.index';
----------------------------

Those two words will be used to look up a controller to use and a method to call on that controller. The controller is looked up by name among the attributes on the OX application (really services, but we will discuss that when we explain Bread::Board).

```perl

sub {
    my $controller = $self->root;
    return $controller->index(@_);
}

```
