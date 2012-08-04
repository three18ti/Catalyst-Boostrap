
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Catalyst based application",
  "AUTHOR" => "jon <three18ti\@gmail.com>",
  "BUILD_REQUIRES" => {
    "Catalyst::Test" => 0,
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Bootstrap",
  "EXE_FILES" => [
    "script/bootstrap_fastcgi.pl",
    "script/bootstrap_cgi.pl",
    "script/bootstrap_test.pl",
    "script/bootstrap_server.pl",
    "script/bootstrap_create.pl"
  ],
  "LICENSE" => "perl",
  "NAME" => "Bootstrap",
  "PREREQ_PM" => {
    "Catalyst" => 0,
    "Catalyst::Action::RenderView" => 0,
    "Catalyst::Controller" => 0,
    "Catalyst::Model" => 0,
    "Catalyst::Plugin::Authorization::Roles" => 0,
    "Catalyst::Plugin::Cache::Memcached::Fast" => 0,
    "Catalyst::Plugin::ConfigLoader" => 0,
    "Catalyst::Plugin::Session::Store::Memcached" => 0,
    "Catalyst::Plugin::Static::Simple" => 0,
    "Catalyst::Runtime" => "5.80",
    "Catalyst::ScriptRunner" => 0,
    "Catalyst::View::TT" => 0,
    "Config::General" => 0,
    "Crypt::Eksblowfish::Bcrypt" => 0,
    "DBD::mysql" => 0,
    "DBIx::Class" => 0,
    "DBIx::Class::EncodedColumn" => 0,
    "Moose" => 0,
    "Test::More" => 0,
    "namespace::autoclean" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.001",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



