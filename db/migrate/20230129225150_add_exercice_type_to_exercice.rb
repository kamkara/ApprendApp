class AddExerciceTypeToExercice < ActiveRecord::Migration[7.0]
  def change
    #Exercice Type and User enum to to select Exercice types
    add_column :exercices, :type, :integer
  end
end
