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

  @username     = params[:username]
  @phone        = params[:phone]
  @time         = params[:time]
  @your_barber  = params[:your_barber]
  @color        = params[:color]

 hh = { :username => 'Введите имя', 
        :phone => 'Введите телефон', 
        :time => 'Введите дату и время', 
        :your_barber => 'Укажите парикмахера', }

  hh.each do |key, value|
    if params[key] == ''
      @error = hh[key]
      return erb :visit
    end
  end
  erb "Ок, #{@username}. Your barber is #{@your_barber}. We'll be waiting for you at #{@time} and call you at number #{@phone}. Color: #{@color}"
end