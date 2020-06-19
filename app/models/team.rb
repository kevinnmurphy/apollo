class Team < ActiveRecord::Base
    belongs_to :user
    has_many :characters, :through => :team_characters
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :description, presence: true

end
