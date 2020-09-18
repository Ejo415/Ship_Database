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
        Ship.create(name: params[:name], klass: params[:klass], registry: params[:registry], affiliation: params[:affiliation], user_id: current_user.id)
        redirect to '/ships'
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
        if current_user.id = ships.user_id
        ship.update(name: params[:name], klass: params[:klass], registry: params[:registry], affiliation: params[:affiliation])
        redirect "/ships/#{ship.id}"
        end
    end

    delete '/ships/:id' do
        redirect_if_not_logged_in
        ship = Ship.find_by_id(params[:id]) 
        ship.destroy
        redirect '/ships'
    end



end