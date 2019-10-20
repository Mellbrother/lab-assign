class RegisteredStudentsController < ApplicationController
  def index
  	@students = Student.all
  	@registered_student_ids = RegisteredStudent.all.map{|rs| rs.student_id}
  end

  def show
  	@student = Student.find(params[:id])
  end

  def register
  	@registered_students = RegisteredStudent.all
  	@students = @registered_students.map{|rs|
  		Student.find_by(id: rs.student_id)
  	}.compact

  end

  def create
  	registered_student = RegisteredStudent.new(registed_student_params)
  	registered_student.save!
  	redirect_to registered_students_path
  end

  def destroy
  	registered_student = RegisteredStudent.find(params[:id])
  	registered_student.delete
  	redirect_to registered_students_register_path
  end

  def rank_up
  	registered_student = RegisteredStudent.find(params[:id])
  end

  def rank_down
  end	

  private

  def registed_student_params
  	params.require(:registered_student).permit(:student_id)
  end
end
