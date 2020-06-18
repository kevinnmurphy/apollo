class CreateTables < ActiveRecord::Migration[5.2]
  def change 
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
    end

    create_table :teams do |t|
      t.string :name
      t.string :description

      t.belongs_to :users
    end

    create_table :characters do |t|
      t.string :name
      t.string :class
      t.string :ability

      t.belongs_to :users
    end

    create_table :team_characters do |t|
      t.integer :team_id
      t.integer :character_id

      t.belongs_to :characters
      t.belongs_to :teams
    end

    create_table :equipments do |t|
      t.string :name
      t.string :description
      t.string :ability

      t.belongs_to :characters
    end
  end
end
