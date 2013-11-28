class AddSizeToStories < ActiveRecord::Migration
  def change
    add_column :stories, :size, :integer
  end
end
