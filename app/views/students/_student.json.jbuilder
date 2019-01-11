json.extract! student, :id, :first_name, :last_name, :admission_number, :department, :year_of_admission, :year_of_completion, :gender, :DOB, :Image, :created_at, :updated_at
json.url student_url(student, format: :json)
