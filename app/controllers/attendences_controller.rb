class AttendencesController < ApplicationController
  def index
    @attendences = Attendence.all
  end

  def show
    @attendence = Attendence.find(attendence_id)
  end

  def new
    @students = Student.all
  end
def destroy
    @attendence.destroy
    respond_to do |format|
      format.html { redirect_to attendences_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
 def create
    if params[:attendence][:student_id]
      @student = Student.find_by id: params[:attendence][:student_id]
      @attendence = @student.attendences.new(attendence_params)
      if @attendence.save
        flash[:notice] = 'Successfully created students register'
        redirect_to attendences_path
      else
        flash.now[:error] = 'Error occurred while creating attendance'
        render :new
      end
    end
  end

  private

  def attendence_params
    params.require(:attendence).permit(
      :admission_number,
      :date,
      :status
    )
  end

  def attendence_id
    params[:id]
  end

  def student
    @student = params[:student_id]
  end
end
