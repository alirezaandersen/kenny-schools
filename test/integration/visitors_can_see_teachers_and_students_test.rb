require 'test_helper'


class VisitorsSeesAllTeachersAndStudentsTest < ActionDispatch::IntegrationTest


  test "vistors can see all teachers and students belonging to specific teachers" do

    rachel = Teacher.create(first_name: "Rachel", last_name: "Warbelow")
    nate   = Teacher.create(first_name: "Nate", last_name: "Allen")

    hedy = rachel.students.create(first_name: "Hedy", last_name: "Woo", age: "30")
    jon = rachel.students.create(first_name: "Jon", last_name: "Liss", age: "21")

    ali = nate.students.create(first_name: "Ali", last_name: "Andersen", age: "35")
    jeneve = nate.students.create(first_name: "Jeneve",last_name: "Parish", age: "38")

    visit '/teachers'

    within("ul li:nth-child(1)") do
      assert page.has_content? "Rachel Warbelow"
      assert page.has_content? "Hedy Woo, 30"
      assert page.has_content? "Jon Liss, 21"
    end

    within("ul li:nth-child(2)") do
      assert page.has_content? "Nate Allen"
      assert page.has_content? "Ali Andersn, 35"
      assert page.has_content? "Jeneve Parish, 38"
    end

  end


end
