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

post '/login' do
  p params
  user = User.create(
    first_name: params['first_name'],
    email: params['email']
  )
  p "Welcome to the site, #{params['first_name']}"
  redirect :account
end

get '/account' do
  erb :account
end

require './models'
