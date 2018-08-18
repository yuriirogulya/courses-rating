module Admin
  class UsersController < Admin::ApplicationController
    def index
      super
      @resources = User
                   .page(params[:page])
                   .per(10)
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   User.find_by!(slug: param)
    # end
  end
end
