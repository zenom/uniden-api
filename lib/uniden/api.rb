require "uniden/api/version"

module Uniden
  class Api
    # Your code goes here...
    autoload :System,     'uniden/api/system'
    autoload :Group,      'uniden/api/group'
    autoload :Settings,   'uniden/api/settings'

    def initialize
    end

  end
end
