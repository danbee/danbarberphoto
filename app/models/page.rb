require 'rdiscount'

class Page < ActiveRecord::Base
  acts_as_markdown :content
end
