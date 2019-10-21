class RegisteredStudentsController < ApplicationController
  before_action :remove_null_registered_students, only: [:register]
  before_action :registered_student_rank_adjust, only: [:register]

  def index
  	@q = Student.all.ransack(params[:q])
  	@students = @q.result(distinct: true)
  	@registered_student_ids = RegisteredStudent.all.map{|rs| rs.student_id}
  end

  def show
  	@student = Student.find(params[:id])
  end

  def register
  	@registered_students = RegisteredStudent.all
  	@students = @registered_students.sort{ |a,b| a.rank <=> b.rank }.map { |rs| Student.find(rs.student_id) }
  end

  def create
  	registered_student = RegisteredStudent.new(registed_student_params)
  	registered_student.rank = RegisteredStudent.count + 1
  	registered_student.save!
  	redirect_to registered_students_path
  end

  def destroy
  	registered_student = RegisteredStudent.find(params[:id])
  	registered_student.delete
  	redirect_to registered_students_register_path
  end

  def rank_up
  	registered_student = RegisteredStudent.find_by(student_id: params[:id])
  	unless registered_student.rank == 1
	  	target = RegisteredStudent.find_by(rank: (registered_student.rank - 1))
	  	tmp = registered_student.rank
	  	registered_student.update(rank: target.rank)
	  	target.update(rank: tmp)
	end
	redirect_to registered_students_register_path
  end

  def rank_down
  	registered_student = RegisteredStudent.find_by(student_id: params[:id])
  	unless registered_student.rank == RegisteredStudent.count
	  	target = RegisteredStudent.find_by(rank: (registered_student.rank + 1))
	  	tmp = registered_student.rank
	  	tmp = registered_student.rank
	  	registered_student.update(rank: target.rank)
	  	target.update(rank: tmp)
	end
	redirect_to registered_students_register_path
  end	

  private

  def registed_student_params
  	params.require(:registered_student).permit(:student_id)
  end

  def remove_null_registered_students
  	RegisteredStudent.all.each do |rs|
  		rs.delete unless Student.find_by(id: rs.student_id)
  	end
  end

  def registered_student_rank_adjust
  	RegisteredStudent.all.sort{ |a,b| a.rank <=> b.rank }.each.with_index(1) do |rs, i|
  		next if rs.rank == i
  		rs.rank = i
  		rs.save!
  	end
  end
end
