require 'spec_helper'

describe Epice::Circuit do
  it 'should extract only the proper lines of the output' do
    out = epice_output
    out.length.should eq(1149)
  end

  it 'should parse numbers correctly' do
    out = epice_output
    out[538].should eq([1.546942e+01, 6.013075e+02, 4.284283e+02, 5.101183e+02])
  end

  it 'should detect field names correctly' do
    out = epice_output
    out.fields.should eq(['time', 'v(3)', 'v(4)', 'v(5)'])
  end
end

