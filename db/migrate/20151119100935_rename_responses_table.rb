class RenameResponsesTable < ActiveRecord::Migration
  def change
    rename_table :responses, :comments
  end
end
