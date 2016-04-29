require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  def test_teacher_can_be_created
    nate = Teacher.new(first_name: "Nate", last_name: "Allen")
    assert nate.save
  end

  def test_can_create_a_student_through_teacher
    nate = Teacher.new(first_name: "Nate", last_name: "Allen")
    assert nate.save
    assert nate.students.create(first_name: "Ali", last_name: "Andersen", age: "35")
  end
end
