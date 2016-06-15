class CreatePdetails < ActiveRecord::Migration
  def change
    create_table :pdetails do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.boolean :male
      t.string :contact

      t.timestamps
    end
  end
end
