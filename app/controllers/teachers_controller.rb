class TeachersController < ApplicationController
  def index
  	@q = Teacher.all.ransack(params[:q])
    @teachers = @q.result(distinct: true).page(params[:page])
  end

  def show
  	@teacher = Teacher.find(params[:id])
  end

  def new
  	@teacher = Teacher.new
  end

  def edit
  	@teacher = Teacher.find(params[:id])
  end

  def update
  	teacher = Teacher.find(params[:id])
  	teacher.update!(teacher_params)
  	redirect_to teachers_url, notice: "学生「#{teacher.name}」を更新しました"
  end

  def create
  	teacher = Teacher.new(teacher_params)
  	teacher.save!
  	redirect_to teachers_url, notice: "学生「#{teacher.name}」を登録しました"
  end

  def destroy
  	teacher = Teacher.find(params[:id])
  	teacher.destroy
  	redirect_to teachers_url, notice: "学生「#{teacher.name}」を削除しました"
  end
  private 

  def teacher_params
  	params.require(:teacher).permit(:mynumber, :name, :research)
  end
end
