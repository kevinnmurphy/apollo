class TeamCharacter < ActiveRecord::Base
    belongs_to :characters
    belongs_to :teams
end
