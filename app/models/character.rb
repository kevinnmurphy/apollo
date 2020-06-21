class Character < ActiveRecord::Base
    belongs_to :user
    has_many :equips
    has_many :character_teams
    has_many :teams, :through => :character_teams
    
    
    validates :name, presence: true
    validates :name, uniqueness: true
    # validates :class, presence: true
    # validates :ability, presence: true

end
