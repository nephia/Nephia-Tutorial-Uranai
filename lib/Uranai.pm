package Uranai;
use strict;
use warnings;
use utf8;
use Nephia;

path '/' => sub {
    my $req = shift;
    return {
        template => 'index.html',
        title    => config->{appname},
        envname  => config->{envname},
        apppath  => 'lib/' . __PACKAGE__ .'.pm',
    };
};

path '/uranai' => sub {
    my $req = shift;

    my @results = qw/ 大凶 凶 吉 小吉 中吉 大吉 /;
    my $result = $results[int rand(@results)];

    my $name = $req->param('name');

    if ($name eq '') {
        return res { redirect('/'); }
    }

    return {
        template => 'uranai.html',
        name     => $req->param('name'),
        result   => $result,
        title    => config->{appname},
        envname  => config->{envname},
    };
};

1;
=head1 NAME

Uranai - Web Application

=head1 SYNOPSIS

  $ plackup

=head1 DESCRIPTION

Uranai is web application based Nephia.

=head1 AUTHOR

clever guy

=head1 SEE ALSO

Nephia

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

