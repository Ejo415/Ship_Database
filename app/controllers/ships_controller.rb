class ShipsController < ApplicationController

    get '/ships' do
        redirect_if_not_logged_in
        #binding.pry
        @ships = current_user.ships
        erb :'ships/index'
    end

    get '/ships/new' do
        redirect_if_not_logged_in
        @crew = Crew.all
        erb :'ships/new'
    end

    post '/ships' do
        redirect_if_not_logged_in
        #binding.pry
        user = current_user
        #binding.pry
        ship = user.ships.build(name: params[:name], klass: params[:klass], registry: params[:registry], affiliation: params[:affiliation])
        
        if ship.save 
        #binding.pry
        redirect to '/ships'
        else 
            erb :'/ships/new'
        end
    end

    get '/ships/:id' do
        redirect_if_not_logged_in
        @ship = Ship.find_by_id(params[:id])
        @crew = Crew.all
        erb :'ships/show'
    end

    get '/ships/:id/edit' do
        redirect_if_not_logged_in
        @ship = Ship.find_by_id(params[:id])
        erb :"ships/edit"
    end

    patch '/ships/:id' do
        redirect_if_not_logged_in
        ship = Ship.find_by_id(params[:id])
        if current_user.id == ship.user_id
        ship.update(name: params[:name], klass: params[:klass], registry: params[:registry], affiliation: params[:affiliation])
        redirect "/ships/#{ship.id}"
        
end
    end

    delete '/ships/:id' do
        redirect_if_not_logged_in
        ship = Ship.find_by_id(params[:id]) 
        if current_user.id == ship.user_id        
        ship.destroy
        redirect '/ships'
        end
    end



end