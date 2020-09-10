class Api::V1::UsersController < ApplicationController
    def index
        @users =User.all

        render json: @users 
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create 
        # byebug
    # @user = User.create(username: user_params["username"], password_digest: BCrypt::Password.create(user_params["password"])
    @user = User.create(user_params)
    
    
    if @user.valid?
      render json: @user,status: 201
    else
      render json: {message: "Invalid username"}
    end

    end

    def login
        # byebug
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          render json: @user
        else
          render json: {message: 'Invalid Username Or Password'}
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
