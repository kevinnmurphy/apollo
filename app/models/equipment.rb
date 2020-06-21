class Equip < ActiveRecord::Base
    belongs_to :character

    validates :name, presence: true
    validates :name, uniqueness: true
    # validates :description, presence: true
    # validates :ability, presence: true
end
