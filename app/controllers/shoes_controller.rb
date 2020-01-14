class ShoesController < ApplicationController
 
    get '/shoes' do
       @shoes = Shoe.all
       erb :'shoes/index'

    end

    get '/shoes/:id' do
        @shoe = Shoe.find_by(id: params[:id])
        erb :'shoes/show'
    end
end