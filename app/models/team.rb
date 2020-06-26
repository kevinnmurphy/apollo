class Team < ActiveRecord::Base
    belongs_to :user
    has_many :character_teams
    has_many :characters, :through => :character_teams
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true

    extend Search::ClassMethods

end
