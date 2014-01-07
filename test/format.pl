format
CORE::format
formatt format::t format't
CORE::formatt CORE::format::t CORE::format't

format asd =
as
# yeah
nothing else really interpolates here yet
.n
 .
.#not the end!
.

format =
=
ok
.

format=
good
.

format foo2::2bar2'baz=
yeah
.

format format
=
ok pretty neat
.

CORE::format asd

                =
amazing
.

CORE::format

                =
yep
.

    # now for stuff that shouldn't work
format ==
format asd ==
format asd asd =
format
==
format asd
==
format asd
asd =
format
asd asd =
format
asd
asd
=
format = asd
format
= asd

# making sure the format actually ends on .
format =
.
=
nope
format
=
.
=
nope

# the . should not be a part of the meta.format
format
.
format asd
.
