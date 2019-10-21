class RegisteredTeachersController < ApplicationController
  before_action :remove_null_registered_teachers, only: [:register]
  before_action :registered_teacher_rank_adjust, only: [:register]

  def index
  	@q = Teacher.all.ransack(params[:q])
  	@teachers = @q.result(distinct: true).page(params[:page])
  	@registered_teacher_ids = RegisteredTeacher.all.map{|rs| rs.teacher_id}
  end

  def show
  	@teacher = Teacher.find(params[:id])
  end

  def register
  	@registered_teachers = RegisteredTeacher.all
  	@teachers = @registered_teachers.sort{ |a,b| a.rank <=> b.rank }.map { |rs| Teacher.find(rs.teacher_id) }
  end

  def create
  	registered_teacher = RegisteredTeacher.new(registed_teacher_params)
  	registered_teacher.rank = RegisteredTeacher.count + 1
  	registered_teacher.save!
  	redirect_to registered_teachers_path
  end

  def destroy
  	registered_teacher = RegisteredTeacher.find(params[:id])
  	registered_teacher.delete
  	redirect_to registered_teachers_register_path
  end

  def rank_up
  	registered_teacher = RegisteredTeacher.find_by(teacher_id: params[:id])
  	unless registered_teacher.rank == 1
	  	target = RegisteredTeacher.find_by(rank: (registered_teacher.rank - 1))
	  	tmp = registered_teacher.rank
	  	registered_teacher.update(rank: target.rank)
	  	target.update(rank: tmp)
	end
	redirect_to registered_teachers_register_path
  end

  def rank_down
  	registered_teacher = RegisteredTeacher.find_by(teacher_id: params[:id])
  	unless registered_teacher.rank == RegisteredTeacher.count
	  	target = RegisteredTeacher.find_by(rank: (registered_teacher.rank + 1))
	  	tmp = registered_teacher.rank
	  	tmp = registered_teacher.rank
	  	registered_teacher.update(rank: target.rank)
	  	target.update(rank: tmp)
	end
	redirect_to registered_teachers_register_path
  end	

  private

  def registed_teacher_params
  	params.require(:registered_teacher).permit(:teacher_id)
  end

  def remove_null_registered_teachers
  	RegisteredTeacher.all.each do |rs|
  		rs.delete unless Teacher.find_by(id: rs.teacher_id)
  	end
  end

  def registered_teacher_rank_adjust
  	RegisteredTeacher.all.sort{ |a,b| a.rank <=> b.rank }.each.with_index(1) do |rs, i|
  		next if rs.rank == i
  		rs.rank = i
  		rs.save!
  	end
  end
end
