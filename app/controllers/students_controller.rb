class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = Student.all
    @studentss =@students.page(params[:page]).per(6)
    @search = Student.search do
    keywords params[:query] ,:fields => [:first_name,:last_name,:admission_number,:department ]
    fulltext params[:query] , highlight: true
    keywords params[:query] , highlight: true
    fulltext params[:query] ,:fields => [:first_name,:last_name,:admission_number,:department ] 
    paginate(:page => params[:page] || 1, :per_page => 6)
    facet :dept
    with(:dept, params[:department]) if params[:department].present?
    facet :year_admission
    with(:year_admission, params[:year_of_admission]) if params[:year_of_admission].present?
    facet :year_completion
     with(:year_completion, params[:year_of_completion]) if params[:year_of_completion].present?
    end
    @students,@stu = @search.results, @search.results
    @total=@search.total
  end
  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:first_name, :last_name, :admission_number, :department, :year_of_admission, :year_of_completion, :gender, :DOB, :Image)
    end
end
