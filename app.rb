require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

def get_db
  return SQLite3::Database.open 'Barbershop.db'
end

configure do
  db = get_db
  db.execute "CREATE TABLE IF NOT EXISTS Users (id integer PRIMARY KEY AUTOINCREMENT, name text, phone text, datestamp text, barber text, color text )"
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
        :your_barber => 'Укажите парикмахера' }

 @error = hh.select { |key,_| params[key] == ''}.values.join(", ")
  
  if @error != ''
    return erb :visit
  end
  
  db = get_db
  db.execute 'insert into Users (name, phone, datestamp, barber, color) values (?, ?, ?, ?, ?)',[@username, @phone, @time, @your_barber, @color]

  erb "Ок, #{@username}. Your barber is #{@your_barber}. We'll be waiting for you at #{@time} and call you at number #{@phone}. Color: #{@color}"
end
