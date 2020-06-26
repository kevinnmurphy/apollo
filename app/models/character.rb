class Character < ActiveRecord::Base
    belongs_to :user
    has_many :equips
    has_many :character_teams
    has_many :teams, :through => :character_teams
    
    
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :klass, presence: true
    validates :ability, presence: true

    # extend Search::ClassMethods

    def self.search(query)
        if !!query
            self.where("name LIKE ?", "%#{query}%")
        else
            self.all
        end
    end

    def self.sort_by_name
        self.order(name: :asc)
    end

end
