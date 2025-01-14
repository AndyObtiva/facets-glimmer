# Ruby Facets 3.2.0

[![Gem Version](https://badge.fury.io/rb/facets-glimmer.svg)](http://badge.fury.io/rb/facets-glimmer)
[![Build Status](https://secure.travis-ci.org/rubyworks/facets.svg)](http://travis-ci.org/rubyworks/facets) &nbsp; &nbsp;
[![Flattr Me](http://api.flattr.com/button/flattr-badge-large.png)](http://flattr.com/thing/324911/Rubyworks-Ruby-Development-Fund)


*"ALL YOUR BASE ARE BELONG TO RUBY"*

This is the [Glimmer](https://github.com/AndyObtiva/glimmer) fork of the Ruby Facets project, packaged as the [facets-glimmer](https://rubygems.org/gems/facets-glimmer) gem.

## Introduction

Ruby Facets is the premiere collection of general purpose method
extensions and standard additions for the Ruby programming language.

Facets houses the largest single collection of methods available for
extending the core capabilities of Ruby's built-in classes and modules.
This collection of extension methods are unique by virtue of their atomicity.
The methods are stored in individual files so that each can be required
independently. This gives developers the potential for much finer control over
which extra methods to bring into their code.

In addition Facets provides a collection of extensions to Ruby standard library
plus a small collection of add-on classes and modules. Together these
libraries constitute an reliable source of reusable components, suitable
to a wide variety of usecases.


## Resources

* Homepage: http://rubyworks.github.com/facets
* Report Bugs: http://github.com/rubyworks/facets/issues
* Mailing List: http://groups.google.com/group/facets-universal/topics
* Wiki Pages: http://wiki.github.com/rubyworks/facets
* Source Code: http://github.com/rubyworks/facets


## Documentation

Facets has special documentation needs due to its extensive breadth.
The documentation generated when installing via RubyGems, or the YARD
docs provided by rubydoc.info can be somewhat unwieldy because it
combines all of Facets in one large set. When using these resources,
it is important to remain aware of the source location of particular
methods.

For better organized online documentation, generated to separate core
extensions from standard libraries, see the [Learn Facets](http://rubyworks.github.com/facets/learn.html) page on the website for links to available documentation.


## Installation

### Bundler

If you are using Bundler with your project, add the facets gem to the project's
Gemfile. Unless you want all of facets loaded be sure to add the `:require => false`
option.

    gem "facets-glimmer", require: false

### RubyGems

The easiest way to install is via RubyGems.

    $ gem install facets-glimmer

### Setup.rb

Facets can be installed the old-fashioned way using [Setup.rb](http://rubyworks.github.com/setup).
Download and unpack the .tar.gz package and run setup.rb, like so:

    $ tar -xvzf facets-2.x.x.tar.gz
    $ cd facets-2.x.x
    $ sudo setup.rb

Facets 2.8+ requires Ruby 1.8.7 or higher. Facets 3.0+ requires Ruby 2.0.0 or higher.


## Mission

Facets holds to the notion that the more we can *reasonably* integrate into
a common foundation, directed toward general needs, the better that foundation
will be able to serve the community. There are a number of advantages here:

* Better Code-reuse
* Collaborative Improvements
* Greater Name Consistency
* One-stop Shop and Installation


## Usage

### CORE Library

At the heart of Ruby Facets is the CORE extensions library. CORE provides
a sizable collection of generally useful methods, along with a few supporting
classes, that extend the functionality of Ruby's core classes and modules.

With the exception of a few *uncommon* extensions, CORE contains anything that
will load automatically when issuing:

    require 'facets'

This loads all the CORE functionality at once. If you plan to use more then a
handful of Facets core methods it is recommended that you require the library in
this way. However, you can also "cherry pick" the CORE library as you prefer.
And for uncommon extensions this must be done. The general require statement for
a core extension library is:

    require 'facets/<class|module>/<method>'

For example:

    require 'facets/time/stamp'

Most "atoms" contain only one method, but exceptions occur when methods
are closely tied together.

You can load per-class or per-module groups of core methods by requiring the
class or module by name. For example"

    require 'facets/time'

Will require all the core Time method extensions.

Note that some methods that were part of CORE in 1.8 and earlier are now part
of MORE libraries. A good example is 'random.rb'. There were separated because
they had more specialized use cases, where as CORE extensions are intended as
general purpose.

#### Method File Names

Operator method redirect files are stored using English names. For instance
`Proc#*` is `proc/op_mul`.

For reference, here is the chart.

     +@   => op_plus
     -@   => op_minus
     +    => op_add
     -    => op_sub
     **   => op_pow
     *    => op_mul
     /    => op_div
     %    => op_mod
     ~    => op_tilde
     <=>  => op_cmp
     <<   => op_lshift
     >>   => op_rshift
     <    => op_lt
     >    => op_gt
     ===  => op_case
     ==   => op_equal
     =~   => op_apply
     <=   => op_lt_eq
     >=   => op_gt_eq
     |    => op_or
     &    => op_and
     ^    => op_xor
     []=  => op_store
     []   => op_fetch

Facets simply takes the '*' and translates it into a string acceptable to all
file systems. Also, if a method ends in '=', '?' or '!' it is simply removed.


### MORE Library (aka Standard Library)

On top of the extensive CORE library, Facets provides extensions for Ruby's
standard library, as well as a small collection of additional modules and
classes to supplement it.

Use this library like you would any other 3rd party library.
The only difference between Facet's Standard library and other libraries
is the lack of any enclosing `Facets::` namespace.

When using Facets extended versions of Ruby's standard libraries,
the libraries have to loaded individually. However you do not need
to load Ruby's library first, as the Facets' library will do that
automatically.

For example, normally one load Ruby's OpenStruct class via:

    require 'ostruct'

To load 'ostruct.rb' plus Facets extensions for it simply use:

    require 'facets/ostruct'

For details pertaining to the functionality of each feature,
please see the API documentation.

## Compatibility

### MRI CRuby Compatibility

Facets 2.8+ requires Ruby 1.8.7 or higher. Facets 3.0+ requires Ruby 2.0.0 or higher.

### JRuby Compatibility

This gem is fully compatible with [JRuby](https://www.jruby.org/), mapping JRuby versions to the [MRI CRuby Compatibility](#mri-cruby-compatibility) guidelines (e.g. JRuby 9.3.4.0 supports Ruby 2.6.x, and thus works with Facets 3.0+).

### RubyMotion Compatibility

This gem is mostly compatible with [RubyMotion](https://www.rubymotion.com/) as it loads all Core and Standard APIs upon including the gem except for the following files:
- Core exclusions:
  - core/facets/range/nudge.rb
  - core/facets/applique/file_helpers.rb
  - core/facets/enumerable/recursively.rb
  - core/facets/hash/recursively.rb
  - core/facets/functor.rb
  - core/facets/lazy.rb
  - core/facets/enumerable/associate.rb
  - core/facets/kernel/as.rb
  - core/facets/kernel/ergo.rb
- Standard exclusions:
  - standard/facets/uri/query.rb
  - standard/facets/date.rb
  - standard/facets/memoizer.rb
  - standard/facets/enumargs.rb
  - standard/facets/erb.rb
  - standard/facets/fileutils/outofdate.rb
  - standard/facets/interval.rb
  - standard/facets/pathname/op_div.rb
  - standard/facets/pathname/exists.rb

## Contribute

This project thrives on contribution!

If you have any extension methods, classes or modules that you think have
very general applicability and would like to see them included in
this project, don't hesitate to submit. Also, if you have better versions
of any thing already included or simply have a patch, they are more than
welcome. We want Ruby Facets to be of the highest quality.


## Development

Facets uses the [Lemon](http://rubyworks.github.com/lemon) testing framework
to handle unit testing, while [QED](http://rubyworks.github.com/qed) specifications
provide tested documentation.

Facets uses [Detroit](http://detroit.github.com) and [Rulebow](http://rubyworks.github.com/rulebow)
build tools. Detroit is a life-cycle tool and Rulebow is a continuous integration tool. These
tools, via the `Assembly` and `Rulebook` scripts respectively, sometimes use other tools such
as [Mast](http://rubyworks.github.com/mast) and [Indexer](http://rubyworks.github.com/indexer).
In addition we support [Rake](https://ruby.github.io/rake/) and [Guard](http://guardgem.org/)
build tools, which most developers are familiar with.
Note, that while these build tools can be easy circumvented, the Mast and Indexer tools are
necessary to prepare Facets for release.

To build the Ruby gem, run this command:

```
rake package
```

## Authors

Much of this collection was written and/or inspired by a variety of great Ruby
developers. Fortunately nearly all utilized works were copyrighted under the same
open licenses, the Ruby License or the more liberal BSD and MIT licenses. In the
one or two exceptions the copyright notice has been included with the source code.
We have since received permission from the various authors to normalize the licensing
to a single license. For this purpose we have chosen the BSD 2 Clause License.
This is the license Ruby itself now uses, so it seemed the most appropriate choice.
It is also almost identical to the MIT license. Any code file not specifically labeled
otherwise shall fall under the this license (which is BSD 2-clause).

In all cases, every effort has been made to give credit where credit is due.
You will find these acknowledgments embedded in the source code. You can see
them in "CREDIT:" and/or "@author" lines.
Also see the [Contributors page](https://github.com/rubyworks/facets/wiki/Contributors)
on the Wiki for a list of all contributing Rubyists. If anyone is missing from
the list, please let us know so we can correct. Thanks.

This collection was put together by, and much of it written by [trans](https://github.com/trans).
If need be, he can be reached via email at transfire at gmail.com.


## License

The collection PER COLLECTION is licensed as follows:

    Ruby Facets
    Copyright (c) 2005-2022 Rubyworks

    Distributed under the terms of the BSD-2 License (same as Ruby license).

The BSD 2 Clause License is a simple open source license. The complete text of the
license accompany this document (see the enclosed LICENSE file).

Acknowledgments and Copyrights for particular snippets of borrowed code
are given in their respective source. At this point, all licensing has been normalized
for all included code. Original authors have given permission for inclusion of their
code under such license, with appropriate credit citations.

## TODO

[TODO.md](TODO.md)

## Changes

[CHANGES.md](CHANGES.md)
## "ALL YOUR BASE ARE BELONG TO RUBY!"

Ruby Facets, Copyright (c) 2005-2022 Rubyworks

Do you Ruby? (http://ruby-lang.org)
