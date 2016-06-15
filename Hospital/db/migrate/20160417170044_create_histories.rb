class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.string :disease
      t.text :comments
      t.date :date
      t.references :User
      t.references :Pdetail

      t.timestamps
    end
    add_index :histories, :User_id
    add_index :histories, :Pdetail_id
  end
end
