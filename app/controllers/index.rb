get '/' do
  @post = Post.limit(50)
  erb :index
end

get '/login' do
  erb :login
end 

get '/logout' do
  session.clear 
  redirect('/')
end

get '/post/:id' do
   @post = Post.find(params[:id])
   @comments = @post.comments
   erb :post, :layout => true
end

get '/post' do
  erb :submit_post
end

get '/profile' do
  @posts = current_user.posts 
  @comments = current_user.comments
  erb :profile
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

post '/:post_id/comments' do
  @comment = Comment.create!(post_id: params[:post_id], user_id: current_user.id,content: params[:comments])
  redirect ("/post/#{params[:post_id]}")
end

post '/submit_post' do
  @post = Post.create!(title: params[:title], user_id: current_user.id, body: params[:body])
  redirect ("/")
end


post '/submit_email' do 
  current_user
  @
end 


post '/submit_about' do 

end 


