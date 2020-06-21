class CharacterTeam < ActiveRecord::Base
    belongs_to :character
    belongs_to :team
end
