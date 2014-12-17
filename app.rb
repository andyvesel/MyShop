require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb "This is the barbershop"
end

get '/about' do
  erb :about
end

get '/contacts' do
  erb :contacts
end

get '/visit' do
  erb :visit
end

post '/visit' do
  erb :visit
end