# Epice

Epice is a minimal wrapper around the SPICE circuit emulation software,
allowing Ruby to pass SPICE a netlist containing a .PRINT statement,
and collect the resulting data.

Output can be obtained as an array of data row arrays, or as an array
of data row hashes in which each value is keyed by its field name.

## Installation

Add this line to your application's Gemfile:

    gem 'epice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install epice

## Usage

    c = Epice::Circuit.new

    ## Set the SPICE command to run.  The netlist will be sent on STDIN.
    # c.spice_cmd = 'ngspice -b'  ## default

    c.netlist = <<-EOT
    ... your netlist, containing a single .PRINT statement, goes here ...
    EOT

    output = c.run
    # => Epice::Output, array of data row arrays

    output.to_hashes
    # => array of data row hashes, keyed by field name

## Bugs

Not possible, I use RSpec.

Just kidding.  Probably lots.

## Blame

Copyright 2012, pete gamache, pete@gamache.org.

This software is released under the MIT License.
