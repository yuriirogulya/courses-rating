module Admin
  class OrganizationsController < Admin::ApplicationController
    def index
      super
      @resources = Organization
                   .page(params[:page])
                   .per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Organization.find_by!(slug: param)
    # end
  end
end
