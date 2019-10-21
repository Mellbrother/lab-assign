class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
  	user = User.find_by(email: session_params[:email])

  	if user&.authenticate(session_params[:password])
  		session[:user_id] = user.id 
      if user.admin?
        redirect_to admin_users_path, notice: 'ログインしました'
      elsif user.student?
        redirect_to registered_teachers_path, notice: 'ログインしました'
      elsif user.teacher   
  	   	redirect_to registered_students_path, notice: 'ログインしました'
      end
  	else
  		render :new, notice: 'ログインに失敗しました'
  	end
  end

  def destroy
  	reset_session
  	redirect_to root_path, notice: 'ログアウトしました'
  end

  private 

  def session_params
  	params.require(:session).permit(:email, :password)
  end
end
