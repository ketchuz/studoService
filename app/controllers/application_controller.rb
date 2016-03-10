require 'jwt'

class ApplicationController < ActionController::API
	include Knock::Authenticable

	helper_method :validateToken, :current_user

	private

	def validateToken
		token = request.headers['HTTP_AUTHENTICATION']
		claims = JWT.decode(token, Rails.application.secrets.auth0_client_secret, false)
		sub = claims[0]['sub'].split('|')
		connection = sub[0]
		user_id = sub[1].to_i
		puts connection + ' | ' + user_id.to_s
		current_user(user_id, connection)
		return 
	end

	def current_user (id, connection)
		@current_user ||= User.find_by_user_id_and_connection(id, connection)
	end
end
