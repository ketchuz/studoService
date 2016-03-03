require 'jwt'

class LoginController < ApplicationController

  def index
  	token = request.headers['HTTP_AUTHENTICATION_KETCHUZ']

  	# claims = JWT.decode token, nil, false

  	claims = JWT.decode(token, Rails.application.secrets.auth0_client_secret, false)

  	sub = claims[0]['sub'].split('|')
  	connection = sub[0]
  	user_id = sub[1].to_i

  	if !User.exists? user_id: user_id
  		user = User.new(name: claims[0]['name'], user_id: user_id, connection: connection, token: token)
  		if user.save!
  			puts 'User created successfully'
  		else 
  			puts 'There has been an error'
  		end
  	else
  		puts 'User already exists'
  	end


  	# if User.where(token: token).first
  	# 	user = User.where(token: token).first
  	# else
  	# 	if User.where(user_id: )
  	# end

  end
end
