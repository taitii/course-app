class Student < ApplicationRecord
    has_many :participants
    has_many :courses, through: :participants
end