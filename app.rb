require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

configure do 
  db = SQLite3::Database.new 'Barbershop.db'
  db.execute "CREATE TABLE IF NOT EXISTS Users
  (
    id integer PRIMARY KEY AUTOINCREMENT,
    Name text,
    Phone text,
    Datestamp text,
    Barber text,
    Color text
    )"
  db.close
end

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

 @error = hh.select { |key,_| params[key] == ''}.values.join(", ")
  
  if @error != ''
    return erb :visit
  end
  
  erb "Ок, #{@username}. Your barber is #{@your_barber}. We'll be waiting for you at #{@time} and call you at number #{@phone}. Color: #{@color}"
end