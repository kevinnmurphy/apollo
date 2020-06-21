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

      t.belongs_to :user
    end

    create_table :characters do |t|
      t.string :name
      t.string :klass
      t.string :ability

      t.belongs_to :user
    end

    create_table :character_teams do |t|
      t.belongs_to :character
      t.belongs_to :team
    end

    create_table :equips do |t|
      t.string :name
      t.string :description
      t.string :ability

      t.belongs_to :character
    end
  end
end
