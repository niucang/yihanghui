class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  wechat_responder

end
