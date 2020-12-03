module Api
  module V1
    class SessionsController < ApplicationController
      def create
        @user = User.find_by(email: session_params[:email])

        if @user && @user.authenticate(session_params[:password])
          login!
          render json: { logged_in: true, user: @user }
        else
          render json: { status: 401, errors: ["Invalid username or password"] }
        end
      end

      def is_logged_in?
        if logged_in? && current_user
          render json: { logged_in: true, user: current_user }
        else
          render json: { logged_in: false, message: "no such user", user: {} }
        end
      end

      def destroy
        logout!
        render json: { status: 200, logged_in: false, user: {} }
      end

      private

      def session_params
        params.require(:user).permit(:username, :email, :password)
      end
    end
  end
end
