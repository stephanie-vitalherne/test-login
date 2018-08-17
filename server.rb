require 'sinatra'
require 'sinatra/activerecord'
# require 'securerandom'
enable :sessions

set :database, 'sqlite3:login.sqlite3'

get '/' do
  p 'Banas'
  @users = User.all
  p @users
  erb :home
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  user = User.new(
    name: params['fullname'],
    email: params['email'],
    password: params['password']
  )
  user.save
  redirect :home
end

get '/login' do
  erb :login
end

post '/login' do
  email = params['email']
  given_password = params['password']
  # check if email exists
  # check to see if the email has a password == form password
  # if they match, log in the user
  user = User.find_by(email: email)
  if user.password == given_password
    session[:user] = email.to_s
    redirect :account
  else
    p 'Invalid credentials'
    redirect :home
  end
end

get '/account' do
  erb :account
end

require './models'
