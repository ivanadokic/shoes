class ShoesController < ApplicationController
 
    get '/shoes' do
       @shoes = Shoe.all
       erb :'shoes/index'

    end
    get '/shoes/new' do
        erb :'shoes/new'
    end

    get '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        erb :'shoes/show'
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
        shoe = Shoe.find_by(id: params[:id])
        shoe .update(params[:shoe])
        redirect "/shoes/#{shoe.id}"
    end
    
    delete '/shoe/:id' do
        shoe = Shoe.find_by(id: params[:id])
        redirect "/shoes"
    end
end