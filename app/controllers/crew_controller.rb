class CrewController < ApplicationController
    
    get '/crew' do
        redirect_if_not_logged_in
        @crew = Crew.all
        erb :'crew/index'
    end

    get '/crew/new' do
        redirect_if_not_logged_in
        @ship = current_user.ships
        erb :'crew/new'
    end

    post '/crew' do
        redirect_if_not_logged_in
        #binding.pry
        Crew.create(name: params[:name], rank: params[:rank], species: params[:species], affiliation: params[:affiliation], ship_id: params[:ship_id])
        @ship = current_user.ships
        redirect to '/crew'

    end

    get '/crew/:id' do
        redirect_if_not_logged_in
        #binding.pry
        @crew = Crew.find_by_id(params[:id])
        @ship = current_user.ships
        erb :'crew/show'
    end

    get '/crew/:id/edit' do
        redirect_if_not_logged_in
        @crew = Crew.find_by_id(params[:id])
        @ship = current_user.ships
        erb :"crew/edit"
    end

    patch '/crew/:id' do
        redirect_if_not_logged_in
        crew = Crew.find_by_id(params[:id])
        crew.update(name: params[:name], rank: params[:rank], species: params[:species], affiliation: params[:affiliation], ship_id: params[:ship_id])
        redirect "/crew/#{crew.id}"
    end

    delete '/crew/:id' do
        redirect_if_not_logged_in
        crew = Crew.find_by_id(params[:id]) 
        crew.destroy
        redirect '/crew'
    end

end