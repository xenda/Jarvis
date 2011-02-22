class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.string :content
      t.string :message_type
      t.integer :project_id

      t.timestamps
    end
    
    add_index :messages, :project_id
  end

  def self.down
    drop_table :messages
  end
end
