class CreateSeeds < ActiveRecord::Migration
  def change
    create_table :seeds do |t|
      t.string :title
      t.string :creator
      t.string :sponsor
      t.string :video_url
      t.string :image_url
      t.text :description
      t.integer :volunteers_asked
      t.integer :money_asked
      t.integer :resources_asked
      t.integer :volunteers
      t.integer :money
      t.integer :resources
      t.string :organization
      t.string :tags
      t.integer :time_limit
      t.integer :votes

      t.timestamps
    end
  end
end
