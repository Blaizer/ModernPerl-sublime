-Perl
=====

Perl syntax highlighting for Sublime Text that isn't terrible

## Description

This is -Perl, pronounced "Minus Perl", a Perl syntax highlighter for Sublime Text which is an upgrade over the original `Perl.tmLanguage`. It's called Minus Perl not because it's a downgrade, but for some pragmatic reasons. I needed a name that was ASCII-betically ordered before Perl, so that this language definition would be used instead of the original when both were installed. I didn't want to use some clunky name like BetterPerl or ImprovedPerl, though, so based on the characters that were acceptable in GitHub repo names, I settled on -Perl.

-Perl uses only the standard highlighting colours, so it should be compatible with your favourite theme. It was, however, designed and tested with the default Monokai theme, so it's most optimal with that.

## Features

Compared to the original `Perl.tmLanguage`:

  * Variables and function/method calls are no longer the same colour!
  * All different kinds of barewords are recognised so that they're not highlighted as functions
  * New Perl keywords like `say` have been added
  * Angle bracket readline/globs are recognised (`<foo/* bar/*>`)

As well as many other highlighting fixes and nuances.

## Install

Simply install this package with Package Control (or otherwise) and it should Just Work. Since `-Perl.tmLanguage` ASCII-betically comes before `Perl.tmLanguage`, this language definition will be used by default instead of `Perl.tmLanguage`.

## Todo

  * Fix quote constructs (`""`, `qw`, `m`, `s`, `tr`, etc.)
  * Make quote constructs recognise escapes, metacharacters, interpolated variables, etc.
  * Fix heredocs
  * Use more `(?>)` constructs for even better performance

## Issues

If you find any bugs or want to suggest any improvements feel free to open an [issue](https://github.com/Blaizer/-Perl-sublime-language/issues/) or send a [pull request](https://github.com/Blaizer/-Perl-sublime-language/compare/). You can also email me at <blaizer@cpan.org>.

## License

&copy; 2013 Blaise Roth <blaizer@cpan.org>.

This is free software. It is licensed under the [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/). Feel free to use this package in your own work. However, if you modify and/or redistribute it, please attribute me in some way, and distribute your work under this or a similar license.
