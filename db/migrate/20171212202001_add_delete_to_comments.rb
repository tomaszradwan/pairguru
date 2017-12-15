class AddDeleteToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :delete, :integer
  end
end
