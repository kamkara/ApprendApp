class CreateAnsweredQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :answered_questions do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :answer, null: false, foreign_key: true
      t.belongs_to :result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
