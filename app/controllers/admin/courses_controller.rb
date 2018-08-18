module Admin
  class CoursesController < Admin::ApplicationController
    def index
      super
      @resources = Course
                   .page(params[:page])
                   .per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Course.find_by!(slug: param)
    # end
  end
end
