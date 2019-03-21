class CreateSecurityQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :security_questions do |t|
  t.string :locale, null: false
  t.string :name, null: false

end
CreateSecurityQuestions.create! locale: :de, name: 'what\'s your mother\'s surname?'
CreateSecurityQuestions.create! locale: :de, name: 'Where were you born?'
CreateSecurityQuestions.create! locale: :de, name: 'your pet\'s name?'
CreateSecurityQuestions.create! locale: :de, name: 'where were you born?'


  end
end
