class ApplicationController < ActionController::Base
  # Setup consul's current_power for easy use in controllers
  include Consul::Controller

  current_power do
    Power.new(current_user)
  end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
