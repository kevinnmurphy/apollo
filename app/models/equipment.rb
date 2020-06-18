class Equipment < ActiveRecord::Base
    belongs_to :characters

    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true
    validates :ability, presence: true
end
