require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "This is the test"
end
