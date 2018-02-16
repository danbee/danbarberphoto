module ApplicationHelper
  def page_title(title)
    if title.present?
      "#{title} - #{APP_CONFIG["page_title"]}"
    else
      APP_CONFIG["page_title"]
    end
  end
end
