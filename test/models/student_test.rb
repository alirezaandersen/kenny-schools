require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def test_student_can_be_created
    ali = Student.new(first_name: "Ali", last_name: "Andersen", age: "30", current_score: "90")
    assert ali.save
  end
end
