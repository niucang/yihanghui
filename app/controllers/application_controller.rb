class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  wechat_api
  before_action :authentication

  def authentication
    if current_user.blank?
      redirect_to users_auth_user_path callback_url: request.original_url
    end
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def login_user user
    session[:user_id] = user.id
  end
end
