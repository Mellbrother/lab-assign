class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @q = User.all.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def new
  	@user = User.new(flash[:user])
  end

  def create
  	user = User.new(user_params)

  	if user.save
  		redirect_to admin_users_path, notice: "「#{user.name}」を登録しました"
  	else 
  		redirect_to new_admin_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
  	end
  end

  def edit
  	@user = User.find(params[:id])
  end

  def show
  	@user = User.find(params[:id])
  end

  def update 
  	@user = User.find(params[:id])

  	if @user.update(user_params)
  		redirect_to admin_users_path(@user), notice: "「#{@user.name}」を更新しました"
  	else
  		render :new
  	end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to admin_users_url, notice: "「#{@user.name}」を削除しました"
  end

  private 

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, \
  		:admin, :student, :teacher)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end

end
