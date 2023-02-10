class ApplicationController < ActionController::Base
  def current_user
    User.first.id
  end
end
