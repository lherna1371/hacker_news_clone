get '/' do
  # Look in app/views/index.erb
  erb :index
end


get '/login' do
  erb :login
end 

get '/logout' do
  session.clear 
  redirect('/')
end


# POST


post '/user' do
   user = User.authenticate(params[:username], params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
  
    redirect to("/")
  else
    @error = "Invalid email or password."
    erb :login
  end
end



post '/create_account' do
  user = User.create!(username: params[:username], password: params[:password])  
  session[:user_id] = user.id
  erb :index
end 

