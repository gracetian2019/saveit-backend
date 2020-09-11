class Api::V1::UsersController < ApplicationController

  before_action :authorized, only: [:persist]
    def index
        @users =User.all

        render json: @users 
    end

    def show
        @user = User.find(params[:id])
        wristband = encode_token({user_id: @user.id})

        render json: {user: UserSerializer.new(@user), token: wristband}
    end

    def persist
      wristband = encode_token({user_id: @user.id})

      render json: {user: UserSerializer.new(@user), token: wristband}
    end

    def create 
        # byebug
    # @user = User.create(username: user_params["username"], password_digest: BCrypt::Password.create(user_params["password"])
    @user = User.create(user_params)
    
    
    if @user.valid?
      wristband = encode_token({user_id: @user.id})
      render json: {user: UserSerializer.new(@user), token: wristband}
    else
      render json: {message: "Invalid username"}
    end

    end

    def login
        # byebug
        @user = User.find_by(username: params[:username])
    
        if @user && @user.authenticate(params[:password])
          wristband = encode_token({user_id: @user.id})

          render json: {user: UserSerializer.new(@user), token: wristband}
        else
          render json: {message: 'Invalid Username Or Password'}
        end
    end

    private

    def user_params
        params.permit(:username, :password)
    end

end
