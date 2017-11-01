class ApplicationController < ActionController::API

  # def issue_token(payload)
	# 	JWT.encode(payload, "secret")
	# end
  #
  #
	# def decoded_token(token)
	# 	begin
	# 		JWT.decode(token, "secret")
	# 	rescue JWT::DecodeError
	# 		[]
	# 	end
	# end
  #
	# def token
	# 	bearer_token = request.headers["Authorization"]
	# 	if bearer_token
	# 		jwt_token = bearer_token.split(" ")[1]
	# 	else
	# 		# no return
	# 	end
	# end
  #
	# def current_user
	# 	decoded_hash = decoded_token(token)
	# 	if !decoded_hash.empty?
	# 		user_id = decoded_hash[0]["user_id"]
	# 		User.find(user_id)
	# 	else
  #
	# 	end
	# end
  #
	# def logged_in?
	# 	!!current_user
	# end

  before_action :authorized

  def encode_token(payload)
    JWT.encode(payload, "sqlitsecret")

  end

  def auth_header
    request.headers["Authorization"]

  end

  # fetch(URL, {
  #   headers: {
  #     'Authorization': Bearer + JWTTOKEN
  #   }
  #   })

  def decoded_token
    if auth_header
      token = auth_header.split(" ")[1] # header: {'Authorization': 'Bearer JWTTOKEN'}
      begin
          JWT.decode(token, "sqlitsecret", true, { algorithm: "HS256" }) #taking in token from frontend, passing in secret, tell it which algorith we're using
      rescue JWT::DecodeError
        [{}] # taking method and decoding
      end 
    end
  end

  def current_user

    if decoded_token
      user_id = decoded_token[0]["user_id"]
      @user = User.find(user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: {message: "Please log in"}, status: 401 unless logged_in?
  end

end
