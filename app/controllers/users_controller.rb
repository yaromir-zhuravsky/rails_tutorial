class UsersController < ApplicationController
  before_action :load_user, only: [:edit, :show, :update]

  def index
    @users = User.order(id: :asc).all
  end

  def new
    @user = User.new
  end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json do
        render json: @user.as_json
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def load_user
   @user = User.find(params[:id])
  end
end
