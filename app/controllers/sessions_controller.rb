class SessionsController < ApplicationController
    
    def new
        
    end
    
    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            
            session[:user_id] = user.id
            session[:user_name] = user.username
            flash[:success] = "Sie wurden erfolgreich angemeldet."
            redirect_to user_path(user)
            
        else
            flash.now[:danger] = "Fehler bei Anmeldedaten !!!"
            render 'new' 
        end
    end
    
    def destroy
        session[:user_id] = nil
        flash[:success] = "Sie wurden erfolgreich abgemeldet."
        redirect_to root_path
        
    end
    
end