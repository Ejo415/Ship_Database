class ShipsController < ApplicationController

    get '/ships' do
        redirect_if_not_logged_in
        @ships = Ship.all
        erb :'ships/index'
    end

    get '/ships/new' do
        redirect_if_not_logged_in
        erb :'ships/new'
    end

    post '/ships' do
        redirect_if_not_logged_in
        #binding.pry
        Ship.create(name: params[:name], klass: params[:klass], registry: params[:registry], affiliation: params[:affiliation])
        redirect to '/ships'
    end

    get '/ships/:id' do
        redirect_if_not_logged_in
        @ship = Ship.find_by_id(params[:id])
        erb :'ships/show'
    end

    get '/ships/:id/edit' do
        redirect_if_not_logged_in
        @ship = Ship.find_by_id(params[:id])
        erb :"ships/edit"
        
    end




end