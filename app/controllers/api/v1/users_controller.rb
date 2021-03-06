module Api
  module V1
    class UsersController < ApplicationController
      def create
        @user = User.new(user_params)
        if @user.save
          login!
          render json: { status: "SUCCESS", logged_in: true, user: @user }
        else
          render json: { status: "INVALID INPUT", errors: @user.errors.full_messages }
        end
      end

      def index
        @users = User.all
        if @users
          render json: { status: "SUCCESS", message: "USERS LOADED", users: @users }
        end
      end

      private

      def user_params
        params.require(:user).permit(
          :username,
          :email,
          :password,
          :password_confirmation
        )
      end
    end
  end
end
