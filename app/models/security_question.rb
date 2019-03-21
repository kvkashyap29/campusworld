class SecurityQuestion < ActiveRecord::Base
  validates :locale, presence: true
  validates :name, presence: true, uniqueness: true
  belongs_to :user
end
