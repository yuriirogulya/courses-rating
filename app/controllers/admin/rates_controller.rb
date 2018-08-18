module Admin
  class RatesController < Admin::ApplicationController
    def index
      super
      @resources = Rate
                   .page(params[:page])
                   .per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Rate.find_by!(slug: param)
    # end
  end
end
