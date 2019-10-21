class StudentsController < ApplicationController
  before_action :require_admin

  def index
    @q = Student.all.ransack(params[:q])
  	@students = @q.result(distinct: true).page(params[:page])
  end

  def show
  	@student = Student.find(params[:id])
  end

  def new
  	@student = Student.new(flash[:student])
  end

  def edit
  	@student = Student.find(params[:id])
  end

  def update
  	student = Student.find(params[:id])
  	student.update!(student_params)
  	redirect_to students_url, notice: "学生「#{student.name}」を更新しました"
  end

  def create
  	student = Student.new(student_params)
  	if student.save
    	redirect_to students_url, notice: "学生「#{student.name}」を登録しました"
    else
      redirect_to new_student_path, flash: {
        student: student,
        error_messages: student.errors.full_messages
      }
    end
  end

  def destroy
  	student = Student.find(params[:id])
  	student.destroy
  	redirect_to students_url, notice: "学生「#{student.name}」を削除しました"
  end
  private 

  def student_params
  	params.require(:student).permit(:mynumber, :name, :gpa, :gp)
  end

   def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
