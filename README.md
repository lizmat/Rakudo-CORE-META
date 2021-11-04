[![Actions Status](https://github.com/lizmat/Rakudo-CORE-META/workflows/test/badge.svg)](https://github.com/lizmat/Rakudo-CORE-META/actions)

NAME
====

Rakudo::CORE::META - Provide zef compatible meta-data for Rakudo

SYNOPSIS
========

```raku
use Rakudo::CORE::META;
say "Rakudo core provides these additional modules:";
.say for %Rakudo::CORE::META<provides>.keys.sort(*.fc);
```

DESCRIPTION
===========

Rakudo::CORE::META provides zef compatible meta-data of the modules that are provided by the Rakudo core, by exporting `%Rakudo::CORE::META` hash. This hash contains information that could be introspected at installation time of the module, or after any Rakudo core update.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

COPYRIGHT AND LICENSE
=====================

Copyright 2021 Elizabeth Mattijsen

Source can be located at: https://github.com/lizmat/Rakudo-CORE-META . Comments and Pull Requests are welcome.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

