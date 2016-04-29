require 'test_helper'


class VistorsCanSeeStrugglingStudentsTest < ActionDispatch::IntegrationTest

  test "vistors can see lowest 5 struggling students" do

    rachel = Teacher.create(first_name: "Rachel", last_name: "Warbelow")
    nate   = Teacher.create(first_name: "Nate", last_name: "Allen")

    john = rachel.students.create(first_name: "John", last_name: "Shine", age: "36", current_score: "20")
    chad = rachel.students.create(first_name: "Chad", last_name: "Army", age: "36", current_score: "40")
    edwin = rachel.students.create(first_name: "Edwin", last_name: "Socks", age: "36", current_score: "45")
    peyton = rachel.students.create(first_name: "Peyton", last_name: "Butle", age: "36", current_score: "55")
    derek = rachel.students.create(first_name: "Derek", last_name: "Butle", age: "36", current_score: "65")
    amy = rachel.students.create(first_name: "Amy", last_name: "Acc", age: "36", current_score: "80")
    ziba = rachel.students.create(first_name: "Ziba", last_name: "Ander", age: "36", current_score: "90")
    spooky = nate.students.create(first_name: "Spooky", last_name: "Ander", age: "36", current_score: "30")

    visit students_path

    within('.struggling') do
      # save_and_open_page
      assert page.has_content? "John Shine : Rachel Warbelow"
      assert page.has_content? "Chad Army : Rachel Warbelow"
      assert page.has_content? "Edwin Socks : Rachel Warbelow"
      assert page.has_content? "Peyton Butle : Rachel Warbelow"
      assert page.has_content? "Spooky Ander : Nate Allen"
    end

      refute page.has_content? "Amy Acc, : Rachel Warbelow"
      refute page.has_content? "Ziba Ander, : Rachel Warbelow"
      refute page.has_content? "Derek Butle, : Rachel Warbelow"
  end

end
