class AddUserId < ActiveRecord::Migration[7.0]
  def change
    add_reference :courses, :user, foreign_key: true
    add_reference :exercices, :user, foreign_key: true
  end
end
