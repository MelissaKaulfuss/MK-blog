class ApplicationController < ActionController::Base
	before_filter :authenticate, :except => [ :index, :show ]
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end

private
def authenticate
	authenticate_or_request_with_http_basic do |name, password|
		name == "admin" && password == "secret"
	end
end
