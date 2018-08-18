class CoursesController < ApplicationController
  include Pagy::Backend

  def index
    course_order = Course.order(updated_at: :desc) # .rating_order
    @pagy, @courses = pagy(policy_scope(course_order), items: 6)
    search_by_params if course_params.present?
  end

  def show
    course
  end

  def new
    @course = authorize Course.new
  end

  def edit
    course
  end

  def create
    @course = authorize Course.new(course_params)
    if @course.update(owner_id: current_user.id)
      redirect_to courses_path, notice: t('.created')
    else
      render :new
    end
  end

  def update
    if course.update(course_params)
      params[:id] = course.slug
      redirect_to course, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    course.destroy
    redirect_to courses_path, notice: t('.destroyed')
  end

  private

  def course
    @course = authorize Course.friendly.find(params[:id])
  end

  def search_by_params
    @pagy, @courses = pagy(SearchCourseQuery.new(course_params).call)
  end

  def course_params
    return false unless params[:course].present?
    permitted_attributes(@course || Course)
  end
end
