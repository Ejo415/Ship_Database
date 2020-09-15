class ShipsController < ApplicationController

    get '/ships' do
        erb :'ships/index'
    end

end