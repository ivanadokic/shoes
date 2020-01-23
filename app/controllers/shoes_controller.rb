class ShoesController < ApplicationController
 
    get '/shoes' do
        if logged_in?
         @shoes = current_user.shoes
         erb :'shoes/index'
         else 
         redirect "/login"
         end
    end 
    
    get '/shoes/new' do
        if logged_in?
         erb :'shoes/new'
        else
            redirect "/login"
        end
    end
    
    get '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        redirect '/shoes' if @shoe.nil?
        if @shoe.user == current_user
        #check if this shoe's user is the current_user
        erb :'shoes/show'
        else 
        redirect "/shoes"
        end
    end
    
    post '/shoes' do
        shoe = Shoe.new(params[:shoe])
        shoe.user_id = current_user.id
        if shoe.category.blank?
            redirect "/shoes/new"
        else
         shoe.save
         redirect "/shoes/#{shoe.id}"
        end
    end
    
    get '/shoes/:id/edit' do
        @shoe = Shoe.find_by(id: params[:id])
        redirect '/shoes' if @shoe.nil?
        if @shoe.user == current_user
        erb :'shoes/edit'
        else
            redirect "/shoes"
        end
    end
    
    put '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        redirect '/shoes' if @shoe.nil?
        if @shoe.user == current_user
           @shoe.update(params[:shoe])
           redirect "/shoes/#{@shoe.id}"
        else
           redirect "/shoes"
        end
    end
    
    delete '/shoes/:id' do
        shoe = Shoe.find_by(id: params[:id])
        redirect '/shoes' if @shoe.nil?
        if @shoe.user == current_user
          shoe.destroy
          redirect "/shoes"
        else
            redirect "/shoes"
        end
    end
end