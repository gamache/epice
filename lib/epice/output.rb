module Epice
  class Output < Array
    attr_accessor :fields
    attr_accessor :raw_output

    ## rather than the default array-of-arrays, return output as an
    ## array of hashes, keyed by field name.
    def to_hashes
      self.map {|values| Hash[fields.zip(values)]}
    end
  end
end
