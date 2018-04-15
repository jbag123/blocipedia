class CreateCollaborators < ActiveRecord::Migration[5.1]
  def change
    create_table :collaborators do |t|
      t.belongs_to :user
      t.belongs_to :wiki
      t.timestamps
    end

    add_index :collaborators, :id, unique: true
  end
end
