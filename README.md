ModernPerl
==========

Perl syntax highlighter for Sublime Text that isn't outdated

## Description

ModernPerl is an updated Perl syntax highlighter for Sublime Text. It's a drop-in replacement for the outdated `Perl.tmLanguage` that comes default with Sublime Text. The name "ModernPerl" was mostly just chosen as a joke to follow the Modern::Perl buzzword thing. Well... it is a modern syntax definition for Perl, and among many bug fixes, it does implement some of Perl's new syntax.

It may be a bit tricky to get all your Perl files to open with the ModernPerl syntax. Make sure you read the **Install** section for the steps that might be required. In any case **check that your files are opened with ModernPerl** once it is installed. This information is shown on the far right of the status bar.

ModernPerl uses only the standard highlighting colors, so it should be compatible with your favorite theme. It was, however, designed and tested with the default Monokai theme, so it's most optimal with that.

## Features

Compared to the original `Perl.tmLanguage`:

  * Huge update to `//`, `s{}{}`. See *messages/2014.01.05.pl* for details
  * Highlights functions as best as it can, so less stuff is white
  * Many different kinds of barewords are recognized so that they're not highlighted as functions
  * New Perl keywords such as `say` and `state` are recognized
  * Angle bracket readline/globs are recognized (`<foo/* bar/*>`)

As well as many other highlighting fixes and nuances.

## Install

1.  Install this package with Package Control (or otherwise).
2.  In Sublime, use *View > Syntax > Open all with current extension as...* to reopen all current Perl files with ModernPerl.
3.  Fresh Perl files should automatically open with ModernPerl, while Perl files that have previously been opened with Sublime will tend to keep the syntax they were last opened with.

    To check this, open a Perl file that has never been opened with Sublime before (create a new *.pl* file if necessary), and check that it opens with ModernPerl.
4.  If fresh files do not open with ModernPerl, use *Preferences > Settings – Syntax Specific – User* on a **file opened with ModernPerl** to open up *ModernPerl.sublime-settings* and put the following into it:

    `{ "extensions": ["pl", "PL", "pm", "pod", "t"] }`
5.  Whenever you open a Perl file that has previously been opened with Sublime, check which syntax it opens with, and manually switch it to ModernPerl if necessary.

## Todo

  * Recognize interpolated characters in double quoted strings
  * Recognize metacharacters in regexes
  * Split up interpolation in repository more for better interpolation of `tr`, `format`, etc.
  * Support for multiple heredocs on one line
  * Further optimization and polish

## Issues

If you find any bugs or want to suggest any improvements feel free to open an [issue](https://github.com/Blaizer/ModernPerl-sublime/issues/) or send a [pull request](https://github.com/Blaizer/ModernPerl-sublime/compare/). You can also email me at <blaizer@cpan.org>. Before doing any of this, let me just repeat that you should **check that your files are opened with ModernPerl**.

## License

&copy; 2013-2014 Blaise Roth <blaizer@cpan.org>.

This is free software. It is licensed under the [Creative Commons Attribution-ShareAlike 3.0 Unported License](http://creativecommons.org/licenses/by-sa/3.0/). Feel free to use this package in your own work. However, if you modify and/or redistribute it, please attribute me in some way, and distribute your work under this or a similar license.
