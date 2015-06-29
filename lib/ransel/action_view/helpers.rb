module Ransel

  module ActionView

    module Helpers

      # list the Breadcrums
      def render_breadcrums
        Ransel::Rendered.new(params[:q]).generate_breadcrums
      end

    end

  end

end