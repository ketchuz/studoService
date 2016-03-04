require 'jwt'

class ApplicationController < ActionController::API
	include Knock::Authenticable

	helper_method :validateToken

	private

	def validateToken
		token = request.headers['HTTP_AUTHENTICATION']
		puts JWT.decode(token, Rails.application.secrets.auth0_client_secret, false)
		return 
	end
end
