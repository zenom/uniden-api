require "uniden/api/version"
require 'active_attr'

module Uniden
  module Api
    # Your code goes here...
    autoload :System,     'uniden/api/system'
    autoload :Group,      'uniden/api/group'
    autoload :Settings,   'uniden/api/settings'
    autoload :Scanner,    'uniden/api/scanner'
    autoload :Site,       'uniden/api/site'

  end
end
