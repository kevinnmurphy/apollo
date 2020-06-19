class TeamCharacter < ActiveRecord::Base
    belongs_to :character
    belongs_to :team
end
