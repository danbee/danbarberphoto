require 'rdiscount'

class Page < ActiveRecord::Base
  def html
    markdown = Markdown.new(self.content, :smart)
    markdown.to_html
  end
end
