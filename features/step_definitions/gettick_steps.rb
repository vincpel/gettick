require 'gettick/gettick'
require 'gettick/quote'

When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `#{app_name} help`)
end

# Add more step definitions here

When /^I try `([^`]*)`$/ do |cmd|
    step %(I run `#{cmd}`)       
end
#
#When(/^I run 'gettick lookup bmo'$/) do |app_name|
#  @app_name = app_name
#  step %(I run `#{app_name} lookup bmo`)
#end

#When /^j'execute `([^`]*)`$/ do |cmd|
#    step %(I run `#{cmd}`)       
#end
#When /^je run `([^`]*)`$/ do |cmd|
#    step %(I run `#{cmd}`)       
#end

