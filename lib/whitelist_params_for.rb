module WhitelistParamsFor
  class Railtie < ::Rails::Railtie
    initializer "whitelist_params_for" do
      ActiveSupport.on_load(:action_controller) do
        require File.join(File.dirname(__FILE__), 'whitelist_params_for/controller_helpers')
        extend WhitelistParamsFor::ControllerHelpers
      end
    end
  end
end
