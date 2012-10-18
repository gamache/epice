Dir[File.dirname(__FILE__) + '/epice/*.rb'].each {|m| require m}

module Epice
  class RuntimeError < ::RuntimeError; end
end

