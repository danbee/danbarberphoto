module Administrate
  module Field
    class Markdown < Administrate::Field::Base
      def rendered
        renderer.render(data).html_safe
      end

      def truncate
        data.to_s[0...truncation_length]
      end

      private

      def renderer
        Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions: {})
      end

      def truncation_length
        options.fetch(:truncate, 50)
      end
    end
  end
end
