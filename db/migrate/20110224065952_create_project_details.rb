class CreateProjectDetails < ActiveRecord::Migration
  def self.up
    create_table :project_details do |t|
      t.integer :project_id
      t.string :name
      t.string :value

      t.timestamps
    end
    
    add_index :project_details, :project_id
  end

  def self.down
    drop_table :project_details
  end
end
