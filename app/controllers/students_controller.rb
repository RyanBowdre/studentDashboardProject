class StudentsController < ApplicationController

  def new
    @dojos = Dojo.all
    @dojo = Dojo.find(params[:id])
  end

  def create
    @dojo = Dojo.find(params[:id])
    # student = Student.new(student_params)
    Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo_id])
    redirect_to "/dojos/#{@dojo.id}"
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @students = Student.where(dojo_id: params[:dojo_id]).where.not(id: params[:id])
  end
  # private
  # def student_params
  #   params.require(:student).permit(:first_name, :last_name. :email, :dojo)
  # end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @students = Student.where(dojo_id: params[:dojo_id]).where.not(id: params[:id])
  end

  def update
    dojo = Dojo.find(params[:dojo_id])
    student = Student.find(params[:id])
    student.first_name = (params[:first_name])
    student.last_name = (params[:last_name])
    student.email = (params[:email])
    student.save
    redirect_to "/dojos/#{dojo.id}/students/#{student.id}"
  end


end



# redirect_to '/dojos/#{params[:student][:dojo].id}/students/#{student.id}'
