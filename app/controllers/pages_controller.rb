class PagesController < ApplicationController

  def home
    # If user is already logged in redirect to articles
    redirect_to articles_path if logged_in?
    
  end

  def about
    
  end
end