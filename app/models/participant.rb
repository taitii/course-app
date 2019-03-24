class Participant < ApplicationRecord   # STARPTABULA KAS SAVIENO STUDENTU AR KURSU
    belongs_to :course
    belongs_to :student

    validates :course_id, :student_id, presence: true

    validate :student_allready_added

    delegate :name, to: :student
    delegate :surname, to: :student

    def student_allready_added
        if Participant.exists?(course_id: course_id, student_id: student_id)
            errors.add(:base, "Student allready added to this course")
        end   
    end    
end
