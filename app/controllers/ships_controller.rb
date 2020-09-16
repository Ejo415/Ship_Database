class ShipsController < ApplicationController

    get '/ships' do
        redirect_if_not_logged_in
        @ships = Ship.all
        erb :'ships/index'
    end

end