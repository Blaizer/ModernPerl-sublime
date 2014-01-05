# Before we start, it's probably a good idea to get well aquainted with Oniguruma Regular Expressions,
# which is what TextMate uses. http://www.geocities.jp/kosako3/oniguruma/doc/RE.txt
# It has a few quirks and non-standard things compared to the obvious standard that is Perl.

# So... interpolation into end patterns is done really dodgily. And I mean *really* dodgily.
# Before the end pattern is compiled, it's looked through as a string for occurances of \1, \2, etc.
# Those escape sequences are then replaced with the text that was captured in the corresponding begin.

# This alone is pretty hacky, and lets us do weird things when what was captured is of null-length,
# as well as lets us put backreferences in places you normally couldn't (like inside character classes).
# Also: consider (\1?) when \1 contains 0 characters, and again when it contains one or more characters.
# Entirely different results indeed, but what captured characters could cause even weirder results?

# The answer is not many, because the replacement text is made safer before it's put in and compiled.
# Certain characters are escaped (by putting a backslash before them in the replacement) *but not all*.

# Escaped punctuation in hacky backreferences: !$^*()-+=[]{}\|:?,.
# Non-escaped punctuation: ~@#%&`;"'<>/

# Why not just escape all non-word characters in the replacement text of hacky backreferences?
# This is certainly a bug. But we have to live with it...

# The escaped characters you never have to worry about. They'll always mean the literal text no matter
# where you put them. For example, these weird-looking things work just fine:
# [a\1z]   can become  [a\-z]   not  [a-z]
# [:a\1]   can become  [:a\:]   not  [:a:]
# {2\1}    can become  {2\,}    not  {2,}

# But the characters that aren't escaped you do have to worry about when a hacky backreference could
# contain one or more. Luckily, there's very few of these cases, though. The full list:
# (?x)\1   can become  (?x)#
# (?x:\1   can become  (?x:#
# [&\1]    can become  [&&]
# [\1]     can become  [&&]

# To get around # messing up your (?x) pattern:
# Try [\1], if the hacky backreference is always a single character.
# Or (?-x:\1), which will always work.

# To get around & messing up your [], try rearranging the terms, or using extra inner [],
# (as Oniguruma Regular Expressions let you do).

# And there's even more special cases when your backreference could be of null-length. This makes playing
# around with them more fun, though. You can do a lot of useful things with weird-looking constructs.
# One useful one is (?!\1) always failing when \1 is null-length, but there are plenty more that I won't
# go into detail about here. I might write about the stuff I've come up with at some point in the future.

# If you're running into troubles with a hacky backreference not doing the right thing in a certain case,
# the best solution is often just to break the capture in the begin into multiple captures.
# Like from ([ab]) to (a)|(b). Then you just have to handle the cases of one of them being empty and the
# other having something in it, and vice versa.

# Now go and abuse these hacky backreferences to your heart's content! I know I have!

s [ \asd ] { \aaa }eeegimosxqegimosx
s < a\sd > ( a\aa ) egimosxq
s ( as\d ) / aa\a /eeegimosxEgimosx
s { $asd } \ $aaa \ egimosxE

s (
    stuff
  )[
    second stuff
  ]egimosx

s(
  stuff
)!
  second stuff
!egimosx

s (
    f
  )
  (
    s
  )egimosx

s < f >#
  yup
#egi

s<
  # nope
> # < yup > #
< # dun think so
  # ok wut
>egimosx

s [
   	first
  ] # comment

    # more comments #

  [
    second
  ]egimosx

s[
  first
] # comment

  # more comments \#

^
  second
^egimosx

s
exit ok

s exit ok

s [ f ] exit ok

s {} exit ok

s {}{}egiqqq
s {k}{}egiqq
s {} {k}egiq
s {}\   \egi

s {}
  {}egi
s() # poop
    # yup
\\egiqmos

s { F }
  exit ok
s { F }
exit ok

s{\{\}}{\{\}}e
{s{\{\}}{\{\}}eg}
{s{\{\}}{\{\}}}e
{{s{\{\}}{\{\}}}eg}
s<<>><<>>e
s<<>><<>>>eg
s<<>><<>>e>
s<<>><<>>>egi>
s<<>><<>>eg>s<>//
s<<>><<>>e>s<>//
s<<>>(())e>s<>//
s<<>>"{}"e>s<>//
s<<>>'[]'e>s<>//

s[]''egiqq
s[]'''Not part of regex!'e
s[]'\\si\ngle\''egiqq
s[]
'\\si\ngle\'''not part of regex!'e

tr{\k$k}{$k\k}cdsrabc
tr ($k\k) '\k$k'cdsrabc
tr{
  k{}k
}
{
  k{}k
}cdsrabc

s///see
s/s//see
s''s'see
s's's'see
tr///cdsr
tr/y//cdsr
tr''y'cdsr
tr'y'y'cdsr

s /
    \thing
  /
    $boob
  /egimosx
s'\s
$s
\s'$s
\s
\s'egimosx

tr /
    \thing
  /
    $boob
  /cdsr
tr'\y
$y
\y'$y
\y
$y'cdsr

s////e #/# subject to change... fourth slash could be a division or start of //
s///s/s/// #/# same thing
s''s''make sure this is a q'
s''s's'make sure this is a q'

s// /s
s// s/s
s//s /s
s// s /s
s'' 's
s''s 's

# Problem characters that go into end patterns unescaped
s#s#s#s
s<s>#s#s
s&s&s&s
s<s>&s&s
s<s>
    &s&s

tr [tr]c # yeah that c shouldn't be part of the tr

# Werid chaining... This is the only quirk of my implementation.
# In both cases, the first meta.tr never ends until the end of the chain.
# It's not recursion, though, so this is actually fine. Hardly noticable.

tr [tr] ]tr]s]tr[tr][tr]s]tr[tr][tr]s]

tr [tr]
]tr]s]tr[tr]]tr]s

# these don't exhibit anything weird though
tr[tr][tr]tr]
tr[tr][tr]tr[
