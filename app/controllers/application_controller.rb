class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def authenticate_admin
    unless current_user.admin?    
      flash.now[:alert] = "Not allow!"
      redirect_to root_path
    end
  end


end


