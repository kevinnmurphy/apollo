class User < ActiveRecord::Base
    has_secure_password

    validates :name, presence: true
    validates :email, presence: true
    validates :name, uniqueness: true

    has_many :teams
    has_many :characters
    has_many :equips

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
end
