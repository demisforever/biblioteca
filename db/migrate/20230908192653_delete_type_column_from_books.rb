class DeleteTypeColumnFromBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :books, :type
  end
end
