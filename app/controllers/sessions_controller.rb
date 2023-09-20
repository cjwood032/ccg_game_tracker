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
        @user = User.find_by(Username: params[:Username])
        current_user = @user
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user), notice: "Welcome back, and good luck!"
        else
          redirect_to signin_path, notice: "Name or password is incorrect"
        end
      end

      def gcreate
        @user = User.find_or_create_by(uid: auth['uid']) do |u|
          if(u.id==nil)
            u.name = auth['info']['name']
            u.password = SecureRandom.hex
            u.Username=u.name
            u.save
            session[:user_id] = u.id
            redirect_to edit_user_path(u), notice: "Please set a password\nand pick some formats you play!"
          else
            session[:user_id] = u.id
            redirect_to user_path(u), notice: "Welcome back, and good luck!"
          end
          
        end
        
      end

      private
      
      def auth
        request.env['omniauth.auth']
      end
      
      def auth_hash
        request.env['omniauth.auth']
      end
end