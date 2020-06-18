class Character < ActiveRecord::Base
    belongs_to :user
    has_many :equipment
    has_many :teams, through: :team_characters
    
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :class, presence: true
    validates :ability, presence: true

end
