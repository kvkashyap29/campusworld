class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable , :security_questionable

  validate :password_complexity

def password_complexity
  if password.present?
     if !password.match(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,70}$/) 
       errors.add :password, 'Complexity requirement not met. Length should be 6-70 characters and include: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
     end
  end
end

end
