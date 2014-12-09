module ApplicationHelper
  def page_title(title)
    if title.present?
      "#{title} - Dan Barber Photography"
    else
      "Dan Barber Photography"
    end
  end
end
