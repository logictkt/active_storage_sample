class CreateUpFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :up_files do |t|
      t.string :name, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
