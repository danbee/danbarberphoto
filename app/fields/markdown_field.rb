require "administrate/field/base"

class MarkdownField < Administrate::Field::Base
  def to_s
    data
  end

  def rendered
    Kramdown::Document.new(data).to_html.html_safe
  end

  def truncate
    data.to_s[0...truncation_length]
  end

  private

  def truncation_length
    options.fetch(:truncate, 50)
  end
end
