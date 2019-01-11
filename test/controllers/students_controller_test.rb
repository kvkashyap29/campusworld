require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { DOB: @student.DOB, Image: @student.Image, admission_number: @student.admission_number, department: @student.department, first_name: @student.first_name, gender: @student.gender, last_name: @student.last_name, year_of_admission: @student.year_of_admission, year_of_completion: @student.year_of_completion } }
    end

    assert_redirected_to student_url(Student.last)
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { DOB: @student.DOB, Image: @student.Image, admission_number: @student.admission_number, department: @student.department, first_name: @student.first_name, gender: @student.gender, last_name: @student.last_name, year_of_admission: @student.year_of_admission, year_of_completion: @student.year_of_completion } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
