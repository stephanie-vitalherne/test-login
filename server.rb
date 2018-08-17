require 'sinatra'
require 'sinatra/activerecord'

set :database, 'sqlite3:login.sqlite3'

get '/' do
  p 'Banas'
  @users = User.all
  p @users
  erb :home
end

get '/login' do
  erb :login
end

require './models'
