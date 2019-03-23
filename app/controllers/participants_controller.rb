class ParticipantsController < ApplicationController
    def index
      @participants = Participant.all
    end    

    def create
      @participant = Participant.new(participant_params)

      if @participant.save
        # redirect_back fallback_location: course_path(course)
        redirect_to action: :index, notice: 'Course was successfully created.'
      else 
        render :new
      end
    end

    private

    def participant_params
        params.require(:participant).permit(:course_id, :student_id)
    end   
end
