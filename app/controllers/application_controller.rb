class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  before_filter :set_iphone_or_ipad_format

  def set_iphone_or_ipad_format
    format = is_iphone_or_ipad_request?
    unless format.nil?
      request.format = format
    end
  end
  
  def is_iphone_or_ipad_request?
    request.user_agent =~ /(iPhone|iPad).+Mobile\/.+Safari/
    $1.downcase if $1
  end
end
