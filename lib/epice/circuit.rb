module Epice
  class Circuit
    attr_accessor :netlist
    attr_accessor :spice_cmd
    attr_reader :last_output

    def spice_cmd
      @spice_cmd || 'ngspice -b'
    end

    def run
      return nil unless netlist
      output = Epice::Output.new

      open("|#{spice_cmd} 2>/dev/null", 'w+') do |spice|
        spice.puts netlist
        spice.close_write
        output.raw_output = spice.read

        output.raw_output.each_line do |line|
          ## we should set fieldnames, if we haven't
          if !output.fields
            if m=line.match(/^Index \s+ (.+) /x)
              output.fields = m[1].split(/\s+/)
            end
          end

          ## but mostly we are here to extract numeric data
          if m=line.match(/^ \d+ \s+ (\d\.\d+e.\d+ .*) /x)
            output << m[1].split(/\s+/).map(&:to_f)
          end
        end
      end

      output
    end
  end
end
