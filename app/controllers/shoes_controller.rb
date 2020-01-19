class ShoesController < ApplicationController
 
    get '/shoes' do
        if logged_in?
         @shoes = Shoe.all
         erb :'shoes/index'
         else 
         redirect "/login"
         end
    end 
    
    get '/shoes/new' do
        erb :'shoes/new'
    end
    
    get '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        # if shoe (if the shoe even exists...)
        # else
        # end
        erb :'shoes/show'
    end
    
    post '/shoes' do
        shoe = Shoe.create(params[:shoe])
        redirect "/shoes/#{shoe.id}"
        # if shoe.save
        # else
        # end
    end
    
    get '/shoes/:id/edit' do
        @shoe = Shoe.find_by(id: params[:id])
        
        erb :'shoes/edit'
    end
    
    put '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        redirect '/shoes' if @shoe.nil?
        @shoe.update(params[:shoe])
        redirect "/shoes/#{@shoe.id}"
        
    end
    
    delete '/shoes/:id' do
        shoe = Shoe.find_by(id: params[:id])
        shoe.destroy
        redirect "/shoes"
    end
end