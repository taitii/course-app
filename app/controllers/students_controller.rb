class StudentsController < ApplicationController
    # Displays all created students
    def index
        @students = Student.all
    end    

    # View specific student
    def show
      @student = Student.find(params[:id])
    end

    # Creates new student in database
    def new
        @student = Student.new
    end    

    # Edits specific student 
    def edit
      @student = Student.find(params[:id])
    end

    # Creates new student and checks if the student is saved or not.
    def create
      @student = Student.new(student_params)

      if @student.save
        redirect_to action: :index, notice: 'Student was successfully created.'
      else 
        render :new
      end
    end

    # Updates existing student if not, returns back edit method
    def update
      @student = Student.find(params[:id])
  
      if @student.update(student_params)
        redirect_to action: :index, notice: 'Student was successfully updated.'
      else
        render :edit
      end
    end

    # Finds the specific student and deletes it
    def destroy
      @student = Student.find(params[:id])
      @student.destroy

      redirect_to action: :index, notice: 'Student was successfully destroyed.'
    end    

    private

    # Define parametrs which can be passed into other methods as arguments
    def student_params
        params.require(:student).permit(:name, :surname)
    end   
end
