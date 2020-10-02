class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/ships'
        end
    end

    post '/signup' do
            @user = User.new(:username => params[:username], :password => params[:password])
            if @user.save
            session[:user_id] = @user.id 
            redirect to '/ships'
           else
            @errors = @user.errors.full_messages.uniq
            erb :'users/signup'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/ships'
        end
    end

    post '/login' do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to '/ships'
        else
            @errors = "Username and/or Password is incorrect."
            erb :'/users/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect to '/login'
        else
            redirect to '/'
        end
    end

    get '/users' do
        if logged_in?
            @users = User.all
            erb :'users/index'
        end
    end

end