class Student < ApplicationRecord
    has_many :participants, dependent: :destroy # Kad dzeš studentu izdzēš visus saistītots participants objektus
    has_many :courses, through: :participants
end