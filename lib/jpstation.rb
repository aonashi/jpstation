require 'jpstation/version'

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

if defined? Rails
  require 'jpstation/railtie'
  require 'jpstation/engine'
end

require 'jpstation/import'
