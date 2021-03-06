class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show

  end

  def activate
    @student = Student.find(params[:id])
    if @student.active
      @student.update_attribute(:active, false)
    else
      @student.update_attribute(:active, true)
    end
    redirect_to student_path(@student.id)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end