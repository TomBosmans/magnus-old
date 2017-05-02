require "administrate/field/base"

class CkEditorField < Administrate::Field::Base
  def to_s
    data
  end

  def to_html
    data.to_s.html_safe
  end
end
