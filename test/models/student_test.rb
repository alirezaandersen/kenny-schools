require 'test_helper'

class StudentTest < ActiveSupport::TestCase

  def test_student_can_be_created
    ali = Student.new(first_name: "Ali", last_name: "Andersen", age: "30", current_score: "90")
    assert ali.save
  end

  def test_only_bottom_5_struggling_students_are_returned

    rachel = Teacher.create(first_name: "Rachel", last_name: "Warbelow")
    nate   = Teacher.create(first_name: "Nate", last_name: "Allen")

    rachel.students.create(first_name: "John",   last_name: "Shine", age: "31", current_score: "20")
    rachel.students.create(first_name: "Chad",   last_name: "Army",  age: "16", current_score: "40")
    rachel.students.create(first_name: "Edwin",  last_name: "Socks", age: "76", current_score: "45")
    rachel.students.create(first_name: "Peyton", last_name: "Butle", age: "45", current_score: "55")
    rachel.students.create(first_name: "Derek",  last_name: "Butle", age: "23", current_score: "65")
    rachel.students.create(first_name: "Amy",    last_name: "Acc",   age: "12", current_score: "80")
    rachel.students.create(first_name: "Ziba",   last_name: "Ander", age: "34", current_score: "90")
    nate.students.create(first_name: "Spooky",   last_name: "Ander", age: "31", current_score: "30")

    students = Student.order(:current_score).limit(5)
    assert_equal 'John',   students[0].first_name
    assert_equal 'Spooky', students[1].first_name
    assert_equal 'Chad',   students[2].first_name
    assert_equal 'Edwin',  students[3].first_name
    assert_equal 'Peyton', students[4].first_name

  end


end
