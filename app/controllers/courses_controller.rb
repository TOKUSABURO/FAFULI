class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_search
  # GET /courses
  def index
    # @courses = Course.all
      @q = Course.ransack(params[:q])
      @courses = @q.result
  end

  # GET /courses/1
  def show
    @comments = @course.comments
    @comment = @course.comments.build
  end


  # GET /courses/new
  def new
    @course = Course.new

  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  def create
    @course = Course.new(course_params)
    @course.user_id = current_user.id
    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end
    def set_search
      @q = Course.ransack(params[:q])
      @courses = @q.result
    end
    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:info_title, :info_details, :free_info_topics, :free_info_details, :price,:rates)
    end
end
