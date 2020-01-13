class CommentsController < ApplicationController

    before_action :find_course
    before_action :find_comment, only: [:destroy, :edit , :update]
    def create
      @comment = @course.comments.create(params[:comment].permit(:content))
  @comment.save
  if @comment.save
    redirect_to course_path(@course)
  else
    redirect_to course_path(@course)
  end
  end

  def destroy
  @comment.destroy
  redirect_to course_path(@course)
  end
  
  def edit
  end
  def update
    if @comment.update(params[:comment].permit(:content))
    redirect_to course_path(@course)
  else
    render 'edit'
  end
  end
  private
  def find_course
  
    @course = Course.find(params[:course_id])
  end
  
  def find_comment
    @comment= @course.comments.find(params[:id])
  end
  end

