class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.references :starrable, :polymorphic => true
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
