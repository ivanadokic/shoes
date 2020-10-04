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
    
#new Action
    get '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        is_nil?
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
        is_nil?
        is_authorized?(@shoe,"/shoes")
        
            erb :'shoes/edit'
    end
    
    put '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        is_nil?
        is_authorized?(@shoe,"/shoes")
           @shoe.update(params[:shoe])
           redirect "/shoes/#{@shoe.id}"
      
    end
    
    #Delete Action
    delete '/shoes/:id' do
        shoe = Shoe.find_by(id: params[:id])
        is_nil?
        is_authorized?(shoe,"/shoes")
        
          shoe.destroy
          redirect "/shoes"
        
    end

    private
    def is_nil?
        redirect '/shoes' if @shoe.nil?
    end



end