<<;
no HEREDOC, "deprecated";

<<"";
lines and lines
<<
everything is ignored
and more lines

no

<<'';
lines and lines
<<'no'
everything is ignored
even escapes don't work \' \- \d \2
and more lines

no

<<EOT;
lines and lines
<<""
everything is \< ig\nored \
\escapes\ still wo\rk

and more lines
EOT
no

<<\EOT;
lines and lines
<<""
everything is \< ignore\d \;

and more lines
EOT
no

<<`hi`
\
hi
no

print join "\n", <<'ARBITRARY @#$%^&*( STUFF' =~ s/\s*$//r, 123, "foo";
ARBITRARY @#$%^&*( STUFF
no

say ord "F", chomp(my $f = <<"1`)2%+-*\34567"), ord "f";
<numbers and stuff>
1`)2%+-*\34567
no

# dont highlight << followed by a number as a heredoc
<<0
<<3
<<123
<<$foo
<<_2
_2
# but \ number is probably a heredoc
<<\2
2

# these never highlight
<< foo
<< \foo
<< \ foo
# but these do
<< "foo"
foo
<< 'foo'
foo


### Stacking heredocs on one line isn't implemented yet! ###

say <<DOUBLE, <<'STACK';
We are in a
DOUBLE
STACK
no

say <<"DOUBLE", <<STACK;
STACK
DOUBLE
STACK
no

say <<STACK, <<'IT', <<"UP";

123
IT

STACK

UP
IT
456

IT

STACK
IT
STACK
789

UP
no

say <<'', <<"", <<'IT', <<"";
uh
IT

and then we all died

but then we

did

IT
And then we died again
IT

no

<<CSS
#s.a { background-color: #CCC }
CSS

<<\JAVASCRIPT
function (foo) { return }
JAVASCRIPT

<<`HTML`
<body><div id="foo">Hello</div></body>
HTML

  << "  JS"
    if (/bar/) {}
  JS

sub foo {
    # code folding works now
    <<  '    PERL'
       say "Hello " while 1;

        <<"        SQL"
            select * from FOO
        SQL

        <<`        XML`
            <foo>
                The thing I don't like about this is that I can't
                inject more end patterns that end on 'XML' or whatever
                within the embedded code. Pretty lame.
            </foo>
        XML
    PERL
}
