class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def stub!
    self.response_body = "none"
  end

end
