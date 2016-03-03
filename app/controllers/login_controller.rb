class LoginController < ApplicationController
  def index
  	token = request.headers['HTTP_AUTHENTICATION_KETCHUZ']
  	
  	# if User.where(token: token).first
  	# 	user = User.where(token: token).first
  	# else
  	# 	if User.where(third_party_id: params[:third_party_id]).first
  	# 		user = User.where(third_party_id: params[:third_party_id]).first
  	# 		user.token = token
  	# 		user.save!
  	# 	else
  	# 		user = User.new(params[:user])
  	# 		user.token = token
  	# 		if user.save!
  	# 			flash[:notice] = 'User Created Successfully'
  	# 		else
  	# 			flash[:notice] = 'There was an error'
  	# 		end
  	# 	end
  	# end

  end
end
