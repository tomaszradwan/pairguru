class RemoveDeleteFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :delete, :integer
  end
end
