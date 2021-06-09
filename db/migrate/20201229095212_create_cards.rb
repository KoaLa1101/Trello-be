class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :validates
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
