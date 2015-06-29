module Ransel
  class Railtie < Rails::Railtie

    initializer "ransel.configure_rails_initialization" do
      ActiveSupport.on_load :action_view do
        include Ransel::ActionView::Helpers
      end
    end

  end

end