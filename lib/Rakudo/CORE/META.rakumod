# sample layout in repository
#${
#   :BUILDPLAN(${
#     "lib/BUILDPLAN.rakumod" => ${
#        :cver("2021.10-46-gd88d1cc0e"),
#        :file("10E86A71646D649AE0856ACE1737E1FFACC669D6"),
#        :time(1631992880.8206868e0)
#      }
#   }),

unit package Rakudo::CORE:ver<0.0.11>:auth<zef:lizmat>;
BEGIN {
    use nqp;
    my $repo    := "https://github.com/rakudo/rakudo";
    my $version :=  nqp::gethllsym("default","SysConfig").rakudo-build-config<version>;
    my $sha     := .contains("g") ?? .split("g").tail !! $_ with $version;

    my %meta =
      .installed
      .map({ .meta<> if .meta<auth> eq "perl" | "Yet Another Society" })  # UNCOVERABLE
      .head
      with CompUnit::RepositoryRegistry.repository-for-name("core");

    our %META = (
      auth        => %meta<auth>,
      authors     => ("Rakudo Core Developers",),  # UNCOVERABLE
      description =>
        "The Rakudo™ Compiler implementing the Raku® Programming Language",
      license     => "Artistic-2.0",
      name        => "Rakudo",
      raku        => $*RAKU.version.Str,
      provides    => (.map({.key => .value.keys.head}).Map  # UNCOVERABLE
                       with %meta<provides>),
      support => (  # UNCOVERABLE
        bugtracker => "$repo/issues",
        email      => "security@raku.org",
        source     => "$repo/archive/$sha.zip",
        irc        => "irc://libera.chat/raku",
      ).Map,
      version  => $version,
    ).Map;
}

# vim: expandtab shiftwidth=4
