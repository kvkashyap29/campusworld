class Student < ApplicationRecord
searchable do
    text :first_name , :as => :first_name_textp
    text :first_name , :stored => true
    text :last_name,  :as => :last_name_textp
    text :last_name, :stored => true
    text :admission_number,  :as => :admission_number_textp
    text :admission_number, :stored => true
    text :department, :as => :department_ass 
    text :department,:stored => true
    time :DOB
    text :DOB,:stored => true
    string :year_of_admission
    string :year_of_completion
    string :dept
    string :year_admission
    string :year_completion
   end
has_many :attendences, dependent: :destroy
    def dept
  self.department
end
 def year_admission
  self.year_of_admission
end
 def year_completion
  self.year_of_completion
end

end