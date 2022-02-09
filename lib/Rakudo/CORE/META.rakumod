# sample layout in repository
#${
#   :BUILDPLAN(${
#     "lib/BUILDPLAN.rakumod" => ${
#        :cver("2021.10-46-gd88d1cc0e"),
#        :file("10E86A71646D649AE0856ACE1737E1FFACC669D6"),
#        :time(1631992880.8206868e0)
#      }
#   }),

my constant $release = "2021.12";

my class Rakudo::CORE {
    our constant %META = do {
        my %meta := CompUnit::RepositoryRegistry
          .repository-for-name("core")
          .installed
          .map({ .meta<> if .meta<auth> eq "perl" }).head;
        my $name    := %meta<name>;
        my $auth    := %meta<auth>;
        my $version := %meta<ver>.Str;
        ( auth        => $auth,
          description =>
            "The Rakudo™ Compiler implementing the Raku® Programming Language",
          dist        => $name ~ ':ver<' ~ $version ~ '>:auth<' ~ $auth ~ '>',
          license     => "Artistic-2.0",
          name        => $name,
          perl        => $version,
          provides    => Map.new((%meta<provides>.map({
              .key => .value.keys.head
          }))),
          source-url => "https://github.com/rakudo/rakudo/releases/download/$release/rakudo-$release.tar.gz",
          version  => $version,
        ).Map
    }
}

=begin pod

=head1 NAME

Rakudo::CORE::META - Provide zef compatible meta-data for Rakudo

=head1 SYNOPSIS

=begin code :lang<raku>

use Rakudo::CORE::META;
say "Rakudo core provides these additional modules:";
.say for %Rakudo::CORE::META<provides>.keys.sort(*.fc);

=end code

=head1 DESCRIPTION

Rakudo::CORE::META provides zef compatible meta-data of the modules that
are provided by the Rakudo core, by exporting C<%Rakudo::CORE::META> hash.
This hash contains information that could be introspected at installation
time of the module, or after any Rakudo core update.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

=head1 COPYRIGHT AND LICENSE

Copyright 2021 Elizabeth Mattijsen

Source can be located at: https://github.com/lizmat/Rakudo-CORE-META .
Comments and Pull Requests are welcome.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
