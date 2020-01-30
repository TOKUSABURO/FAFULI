class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_search
  # GET /courses
  def index
      @q = Course.ransack(params[:q])
      if params[:q]
        @courses = @q.result
      else
        @courses = Course.all
      end

  end

  # GET /courses/1
  def show
    @comments = @course.comments
    @comment = @course.comments.build
    @purchases=Purchase.all
    if @course.comments.average(:rating).present?
      @average_rating = @course.comments.average(:rating).round(2)
    end
  end


  # GET /courses/new
  def new
    @course = Course.new

  end

  # GET /courses/1/edit
  def edit
  end
  def contact_us
     @courses = Course.all

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
      params.require(:course).permit(:info_title, :info_details, :free_info_topics, :free_info_details, :price )
    end
end
