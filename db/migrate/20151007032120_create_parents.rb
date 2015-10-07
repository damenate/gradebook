class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :name
      t.string :email
      t.integer :student_id
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
