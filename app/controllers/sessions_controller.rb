class SessionsController < ApplicationController
    def destroy
        session[:user_id] = nil
        redirect_to root_url
      end
    
      def new
        @user = User.new
        @users = User.all
      end
    
      def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome back, and good luck!"
        else
            redirect_to signin_path
        end
      end
      def gcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.image = auth['info']['image']
        end
     
        session[:user_id] = @user.id
     
        redirect_to user_path(@user), notice: "Welcome back, and good luck!"
      end
      private
      def auth
        request.env['omniauth.auth']
      end
end