class PagePresenter < SimpleDelegator
  def content_as_html
    Kramdown::Document.new(content).to_html.html_safe
  end
end
