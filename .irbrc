require 'rubygems' rescue nil
require 'wirble'
require 'hirb'
Wirble.init
Wirble.colorize
Hirb::View.enable


# Assuming we're on a Rails console ... railsrc is for good students ...
def recognize_path(path)
  route = Rails.application.routes.recognize_path(path)
  controller = route[:controller]
  action = route[:action]
  puts "Controller: #{controller}"
  puts "Action: #{action}"
end
