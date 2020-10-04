class UsersController < ApplicationController
   #create new user
    get '/signup' do
      erb :"/users/new.html"
    end

    post "/signup" do
        #check that the fields are filled in
      if params[:user].values.any? {|v|v.blank?}
        redirect '/signup'
      #check that the username isn't taken
      elsif User.find_by(username: params[:user][:username])
        redirect '/login'
      else
      # Create a new user
        @user = User.create(params[:user])

      # log them in, look at session hash and add a key to the session hash we call it user_id
        session[:user_id] = @user.id
  
      # redirect them to a show page
         redirect "/users"
    end
  end
  

    get "/users" do
      @user = current_user
      erb :"/users/show.html"
    end

    get "/logout" do
     session.clear
     redirect "/"
    end

    get "/login" do
     erb :"/users/login.html" 
    end

    post "/login" do
     #did they give a valid username?
      user = User.find_by(username: params[:user][:username])
  
      if user && user.authenticate(params[:user][:password])
        #they succesifully logged in!
        session[:user_id] = user.id
 
        redirect "/users"
      else
        redirect "/login"
        
      end
    end

    get "/logout" do
      session.destroy
      redirect "/"
    end

    # GET: /users/5
  get "/users/:id" do
    @user = User.find_by(id: params[:id])
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end


  
end