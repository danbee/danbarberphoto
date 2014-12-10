module EntityHelper
  def e(entity)
    "&#{entity};".html_safe
  end
end
