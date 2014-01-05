use ModernPerl 2014.01.05;

# Sorry for interrupting you, but...
"ModernPerl has been updated!";

--- Fixed the scopes a bit for better coloring with more themes. Short example:
    use version 0.77;
    # Do everything!
    sub doit ($) {
        my $foo = version->parse($_[0]);
        die qq(Nope) if $foo < version->declare(v0.1_2);
    }

--- Fixed many bugs, including some performance issues

--- All quoting constructs have been completely rewritten,
    so now 100% of the original Perl syntax has been updated, fixed, or replaced!

        "Added a system for $interpolation to be added\012";
        qq$The system can handle the \$weirdness of using different quote characters$;
            `Currently the only double-quote interp-sequences recognized are:
                                $foo, @foo, \`, \777, \xff, \X   but more are coming`;
        qx/Support for complicated interpolation like @{$foo[2][4]}->{"some","thing"} also coming/;
            # The idea is to show you exactly what is and isn't literal
                # But making every interp-sequence work right with all surrounding quotes is tough

        q(  Single-quote interpolation now shows you if your backslashes are literal or not:
                    \(  \ \w \;  \\  \)       \)\)\)
            also (nesting) the quote character works (as it always has)                     );
        q*It works for \*all\* \(ASCII\) quote characters*;

        "bare" /regex/ "is guessed better";
            "Things like" / / "don't break everything";
            "Also things like" $foo/$bar + 2/$baz "aren't incorrectly guessed as regex";
            "If you stick to" $foo / 2 and $foo/2 "for division, things will look fine";
            "Using things that would normally come before a regex allows for multi-line //";
                # Stuff like the binding operators (=~ !~ ~~)
                $foo =~ /
                    Yep, this is a multi-line regex
                /i;
                # A place that looks like the start of a sub-expression
                while ($foo and /
                    multi-line
                /i) {}
                # Or a place where you'd expect the return value of a regex
                ($foo) = /
                    (multi-line)
                /i;
                # And many more
                    # Obviously you can use m// if you need to be explicit
                        # But I'm willing to add in more special cases if you find any worthy

        s/Substitution is much less buggy
                                         /and, yes, it knows the r switch.../rx;
        s(Getting)
            # comments
                /to work between quote pairs/i;
                    # was tough!
        s[But I've ended up with a very robust quote-pair system that's hard to trick!]
            <See test/regexp.s.pl for everything I've thrown at it!>;
                # There's also a quasi blog-post in that file
                    # It documents a small part of what I went through to make all of this possible
                # Also check out the s/tr definition in ModernPerl.tmLanguage.yaml.ep if you dare
                    # It's 160 lines... and so complicated that I'm amazed I even came up with it
                # Actually... check out any of that file
                    # It's pretty cool, because it shows the tmLanguage system pushed to its limits

        m/Better interpolation of quoting constructs,
            (including regex interpolation to show you exactly what is and isn't a metacharacter)
                will be the focus of the next patch to ModernPerl!
            This patch has introduced a good framework to do it, though./mmm;

###
Found a bug or have some feedback? Please let me know!
Check out the README.md for details on sending issues.
