class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :current_score
      t.references :teacher, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
