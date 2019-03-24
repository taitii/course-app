class ParticipantsController < ApplicationController
   
    def create
      @participant = Participant.new(participant_params)
      if @participant.save! # Izsaukuma zīme neļaus nomirt "save" bez error
        redirect_to course_path(params[:course_id])
      end
    end

    def destroy
      @participant = Participant.find(params[:id])
      @participant.destroy

      redirect_to course_path(@participant.course.id)
    end  

    private

    def participant_params
      params.permit(:course_id, :student_id)
    end   
end
