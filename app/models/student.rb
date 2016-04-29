class Student < ActiveRecord::Base
  belongs_to :teacher


  def struggling_students
    self.order(:current_score).limit(5).pluck(:first_name, :last_name)
  end

  # def struggling_students
  #   byebug
  # end

end
