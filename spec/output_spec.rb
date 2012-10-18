require 'spec_helper'

describe Epice::Output do
  it 'should have fields set' do
    out = epice_output
    out.fields.should_not be_nil
    out.fields.should eq(['time', 'v(3)', 'v(4)', 'v(5)'])
  end

  describe '.raw_output' do
    it 'should equal raw_spice_output' do
      out = epice_output
      out.raw_output.should eq(raw_spice_output)
    end
  end

  describe '.to_hashes' do
    it 'should have the same row count as the original output' do
      out = epice_output
      hashes = out.to_hashes
      hashes.length.should eq(1149)
    end

    it 'should use the fields as the keys' do
      out = epice_output
      hashes = out.to_hashes
      hashes.first.keys.should eq(out.fields)
    end

    it 'should zip fields and values correctly' do
      out = epice_output
      hashes = out.to_hashes
      hashes.first.should eq({'time' => 1.500036e+01,
                              'v(3)' => 1.405555e+03,
                              'v(4)' => 7.465949e+02,
                              'v(5)' => 4.506099e+02})

    end
  end
end
