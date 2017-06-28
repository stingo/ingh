class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration
  def self.up
    create_table :comments, :force => true do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :title
      t.text :body
      t.string :subject
      t.integer :profile_id, :null => false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end

    add_index :comments, :profile_id
    add_index :comments, [:commentable_id, :commentable_type]
  end

  def self.down
    drop_table :comments
  end
end
