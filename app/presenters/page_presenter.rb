class PagePresenter < SimpleDelegator
  def content_as_html
    PagePresenter.markdown.render(content).html_safe
  end

  def self.markdown
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
  end
end
