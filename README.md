ModernPerl
==========

Perl syntax highlighter for Sublime Text that isn't outdated

## Description

ModernPerl is an updated Perl syntax highlighter for Sublime Text. It's a drop-in replacement for the outdated `Perl.tmLanguage` that comes default with Sublime Text. The name "ModernPerl" was chosen for a few reasons. The fact that it's less buggy and implements some new stuff is one reason. The name also has a pragmatic reason. I needed a name that was ASCII-betically ordered before Perl, so that this language definition would be used instead of the original when both were installed. (And the other reason for the name was to follow the Modern::Perl buzzword thing.)

ModernPerl uses only the standard highlighting colours, so it should be compatible with your favourite theme. It was, however, designed and tested with the default Monokai theme, so it's most optimal with that.

## Features

Compared to the original `Perl.tmLanguage`:

  * Highlights functions as best as it can, so less stuff is white
  * Many different kinds of barewords are recognised so that they're not highlighted as functions
  * New Perl keywords such as `say` and `state` are recognised
  * Angle bracket readline/globs are recognised (`<foo/* bar/*>`)

As well as many other highlighting fixes and nuances.

## Install

Simply install this package with Package Control (or otherwise) and it should Just Work. `ModernPerl.tmLanguage` ASCII-betically comes before `Perl.tmLanguage`, so this language definition will be used by default instead of `Perl.tmLanguage`.

## Todo

  * Fix quote constructs (`""`, `qw`, `m`, `s`, `tr`, heredocs, etc.)
  * Make quote constructs recognise escapes, metacharacters, interpolated variables, etc.
  * Use more possesive constructs for small gains in performance

## Issues

If you find any bugs or want to suggest any improvements feel free to open an [issue](https://github.com/Blaizer/ModernPerl-sublime/issues/) or send a [pull request](https://github.com/Blaizer/ModernPerl-sublime/compare/). You can also email me at <blaizer@cpan.org>.

## License

&copy; 2013 Blaise Roth <blaizer@cpan.org>.

This is free software. It is licensed under the [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/). Feel free to use this package in your own work. However, if you modify and/or redistribute it, please attribute me in some way, and distribute your work under this or a similar license.
