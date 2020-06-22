class AddEquipsToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :equips, :user, foreign_key: true
  end
end
