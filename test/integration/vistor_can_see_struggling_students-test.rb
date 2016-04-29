require 'test_helper'


class VistorCanSeeStrugglingStudentsTest < ActionDispatch::IntegrationTest

  test "vistor can see lowest 5 struggling students" do

    rachel = Teacher.create(first_name: "Rachel", last_name: "Warbelow")
    nate   = Teacher.create(first_name: "Nate", last_name: "Allen")

    john = rachel.students.create(first_name: "John", last_name: "Shine", age: "36", current_score: "20")
    chad = rachel.students.create(first_name: "Chad", last_name: "Army", age: "36", current_score: "40")
    edwin = rachel.students.create(first_name: "Edwin", last_name: "Socks", age: "36", current_score: "45")
    peyton = rachel.students.create(first_name: "Peyton", last_name: "Butle", age: "36", current_score: "55")
    derek = rachel.students.create(first_name: "Derek", last_name: "Butle", age: "36", current_score: "65")
    amy = rachel.students.create(first_name: "Amy", last_name: "Acc", age: "36", current_score: "80")
    ziba = rachel.students.create(first_name: "Ziba", last_name: "Ander", age: "36", current_score: "90")
    ziba = nate.students.create(first_name: "Spooky", last_name: "Ander", age: "36", current_score: "70")

    visit '/students'

    within('.struggling') do
      assert page.has_content? "Student name: John Shine, Teacher Name: Rachel Warbelow"
      assert page.has_content? "Student name: Chad Army, Teacher Name: Rachel Warbelow"
      assert page.has_content? "Student name: Edwin Socks, Teacher Name: Rachel Warbelow"
      assert page.has_content? "Student name: Peyton Butle, Teacher Name: Rachel Warbelow"
      assert page.has_content? "Student name: Derek Butle, Teacher Name: Rachel Warbelow"
      
      refute page.has_content? "Student name: Amy Acc, Teacher Name: Rachel Warbelow"
      refute page.has_content? "Student name: Ziba Ander, Teacher Name: Rachel Warbelow"
      refute page.has_content? "Student name: Spooky Ander, Teacher Name: Nate Allen"
    end
  end

end
