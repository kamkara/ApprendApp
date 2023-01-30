class AddTitleToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :title, :string
  end
end
