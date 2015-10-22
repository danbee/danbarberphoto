module Administrate
  module Field
    class Markdown < Administrate::Field::Base
      def rendered
        renderer.render(data).html_safe
      end

      private

      def renderer
        Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions: {})
      end
    end
  end
end
