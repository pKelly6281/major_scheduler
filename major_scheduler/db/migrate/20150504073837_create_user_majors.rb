class CreateUserMajors < ActiveRecord::Migration
  def change
    create_table :user_majors do |t|
      t.integer :major_id
      t.integer :user_id

      t.timestamps
    end
  end
end
