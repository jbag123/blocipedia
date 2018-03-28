class CreateAmounts < ActiveRecord::Migration[5.1]
  def change
    create_table :amounts do |t|
      t.integer :value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
