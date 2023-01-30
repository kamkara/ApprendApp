class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :exercice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
