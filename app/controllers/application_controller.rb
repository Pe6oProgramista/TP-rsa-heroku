class ApplicationController < ActionController::Base
	require "rsa.rb"
	protect_from_forgery with: :null_session
end
