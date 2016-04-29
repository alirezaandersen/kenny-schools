class StudentsController < ApplicationController

  def index
    @students = Student.order(:current_score).limit(5)
  end



end
