class ApplicationController < ActionController::API
  before_action :authorized
  # def authenticate_user
  #   if !current_user
  #     render json: {error: "Not Authenticated"}, status: 401
  #   end
  # end

  def encode_token(payload)
    JWT.encode(payload, "secret")
  end

  def auth_header
    request.headers['Authenticate']
  end

  def decoded_token
    byebug
    if auth_header
      puts "decoded token" * 100

      token = auth_header.split(" ")[1]
      begin
        # decode returns an array with the first element being the decoded info hash.
        JWT.decode(token, 'secret', true, { algorithm: 'HS256' }).first
      rescue JWT::DecodeError
        return nil
      end
    end
  end

  # def id_from_token
  #   decoded = decode_token
  #
  #   if decoded
  #     decoded["id"]
  #   end
  # end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    else
      puts "current_user method" * 100
      nil
    end
  end
end
