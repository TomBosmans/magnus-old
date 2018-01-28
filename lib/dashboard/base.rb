module Dashboard
  class Base
    attr_accessor(
      :show_presenter_class,
      :index_presenter_class,
      :edit_form_class,
      :new_form_class
    )

    def edit_form_class
      @edit_form_class || default_form_class
    end

    def new_form_class
      @new_form_class || default_form_class
    end

    def show_presenter_class
      @show_presenter_class || default_show_presenter_class
    end

    def index_presenter_class
      @index_presenter_class || default_index_presenter_class
    end

    private

    def model_class
      self.class.to_s.slice!('Dashboard').constantize
    end

    def defualt_form_class
      "#{model_class}Form".constantize
    end

    def default_show_presenter_class
      "#{model_class}Show".constantize
    end

    def default_index_presenter_class
      "#{model_class}Index".constantize
    end
  end
end
