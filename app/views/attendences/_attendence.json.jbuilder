json.extract! attendence, :id, :status, :date, :student_id, :created_at, :updated_at
json.url attendence_url(attendence, format: :json)
