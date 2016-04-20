require "administrate/field/base"

class ColourField < Administrate::Field::Base
  def to_s
    data
  end
end
