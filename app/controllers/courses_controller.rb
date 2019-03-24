class CoursesController < ApplicationController
    # Displays all created courses
    def index
        @courses = Course.all
    end    

    # View specific course
    def show
      @course = Course.find(params[:id])
      course_students = @course.students.pluck(:id) || [] # JA kursam nav neviens students tad atgriež tukšu array
      student_ids = (Student.all.pluck(:id) || [] ) - course_students # ja nebūs neviens students, tad arī atgriež tuksu array
      @students = Student.where(id: student_ids)
    end

    # Creates new course in database
    def new
        @course = Course.new
    end    

    # Edits specific course 
    def edit
      @course = Course.find(params[:id])
    end

    # Creates new course and checks if the course is saved or not.
    def create
      @course = Course.new(course_params)

      if @course.save
        redirect_to action: :index, notice: 'Course was successfully created.'
      else 
        render :new
      end
    end

    # Updates existing course if not, returns back edit method
    def update
      @course = Course.find(params[:id])
  
      if @course.update(course_params)
        redirect_to action: :index, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end

    # Finds the specific course and deletes it
    def destroy
        @course = Course.find(params[:id])
        @course.destroy

        redirect_to action: :index, notice: 'Course was successfully destroyed.'
    end    

    private

    # Define parametrs which can be passed into other methods
    def course_params
        params.require(:course).permit(:title, :description, :begins_at, :ends_at, :min_participants, :max_participants)
    end   
end
