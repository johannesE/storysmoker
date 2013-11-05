class AddEditableToStories < ActiveRecord::Migration
  def change
    add_column :stories, :editable, :integer
  end
end
