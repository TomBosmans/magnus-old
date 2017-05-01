module Admin
  class DummiesController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Dummy.
    #     page(params[:page]).
    #     per(10)
    # end
    
    def sort
      params['row_order_position'].each do |_key,value|
        Dummy.find(value[:id]).update_attribute(:position, value[:position])
      end
      render nothing: true
    end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Dummy.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information
  end
end
