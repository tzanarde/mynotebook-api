class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :contact_name
      t.string :email
      t.date :birthdate

      t.timestamps
    end
  end
end
