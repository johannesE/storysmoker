class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :content

      t.references :story, index: true

      t.timestamps
    end

  end
end
