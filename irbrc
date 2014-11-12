require 'rubygems' rescue nil
require 'wirble'
require 'hirb'

Wirble.init
Wirble.colorize
Hirb::View.enable

railsrc_path = File.expand_path('~/.railsrc')
if ( ENV['RAILS_ENV'] || defined? Rails ) && File.exist?( railsrc_path )
  begin
    load railsrc_path
  rescue Exception
    warn "Could not load: #{ railsrc_path }" # because of $!.message
  end
end
