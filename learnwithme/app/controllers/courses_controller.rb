class CoursesController < ApplicationController
  def index
    if current_user
      @user = User.find(current_user.id)
      p "&" *100
      p @user
    end
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to edit_course_path(@course)
    else
      @errors = @course.errors.messages
      render 'new'
    end
  end

  def show
    @course = Course.find(params[:id])
  end


  def edit
    @course= Course.find(params[:id])
  end



  private

  def course_params
    params.require(:course).permit(:title, :short_desc, :long_desc, :location)
  end

end
