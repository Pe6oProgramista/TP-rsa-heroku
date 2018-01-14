class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :mess
      t.integer :messid

      t.timestamps
    end
  end
end
