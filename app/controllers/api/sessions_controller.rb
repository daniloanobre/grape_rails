class Api::SessionsController < Api::BaseController
  skip_before_action :require_login!, only: [:create]

  def create
    resource = User.find_for_database_authentication(:email => params[:user_login][:email])
    return invalid_login_attempt unless resource

    if resource.valid_password?(params[:user_login][:password])
      auth_token = resource.generate_auth_token
      render json: { auth_token: auth_token }
    else
      invalid_login_attempt
    end

  end

  def posts
    resource = current_user

    @posts = Post.all
    render json: { posts: { posts: @posts }}, status: 200
  end

  def post
    resource = current_user

    @post = Post.where(id: params[:post_id]).first!
    render json: { post: @post }, status: 200
  end

  def destroy
    resource = current_user
    resource.invalidate_auth_token
    head :ok
  end

  private
  def invalid_login_attempt
    render json: { errors: [ { detail:"Error with your login or password" }]}, status: 401
  end
end
