class Course < ApplicationRecord
    has_many :participants
    has_many :students, through: :participants

    validates :begins_at, :ends_at, :title, presence: true
    validate :start_and_end_dates  
    validate :valid_course_participant_count

    
    def start_and_end_dates
      # On creating course checks if start date isnt today 
        if begins_at.present? && begins_at < (DateTime.current + 1.day) #Present asks if theres some value for begins_at
            errors.add(:begins_at, "cant be today or any date from the past")
        end  

      # On creating course checks if end date isnt today   
        if ends_at.present? && ends_at < (DateTime.current + 1.day)
            errors.add(:ends_at, "cant be today or any date from the past")
        end 

        # On creating course end date isnt smaller than begin date
        if begins_at.present? && ends_at.present? && begins_at >= ends_at
            errors.add(:ends_at, "end date must be bigger than start date")
        end 
    end    

    def validate_participants_count
        # Checks if group is full yet
        if participants.count >= max_participants
            errors.add(:base, "The group is full!")
        end    
    end  
    
    def has_course_started
        # Checks if the course has started yet, if it has - you cant join
        if begins_at <= DateTime.current
          errors.add(:begins_at, "You cant apply to the course, because it has started allready")
        end
    end  

# Šī metode ir paredzēta, lai pārbaudītu vai sākuma datums un beigu datums nav mazāks par šodienas datumu
    # def valid_start_date
    #   if begins_at.present? && begins_at < (DateTime.current + 1.day) #Present asks if theres some value for begins_at
    #       puts("")
    #   end
    # end    

    def valid_course_participant_count
      # Checks if min_participants or max_participants arent smaller or equal to 0 and if max_participants arent lesser than min_participants
      if min_participants <= 0 || max_participants <= 0 || max_participants < min_participants
          errors.add(:min_participants, "and max participants cant be equal or less than 0 and max participants cant be less than min participants")
      end
    end  
end

