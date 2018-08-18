module Admin
  class CitiesController < Admin::ApplicationController
    def index
      super
      @resources = City.page(params[:page]).per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   City.find_by!(slug: param)
    # end
  end
end
