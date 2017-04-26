require 'administrate/field/base'

class UploadField < Administrate::Field::Base
  def url
    data.url
  end

  def small
    data.url(:small)
  end

  def to_s
    data
  end
end
