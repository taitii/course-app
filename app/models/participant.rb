class Participant < ApplicationRecord
    belongs_to :course
    belongs_to :student

    validates :user_id, :student_id, presence: true
end
