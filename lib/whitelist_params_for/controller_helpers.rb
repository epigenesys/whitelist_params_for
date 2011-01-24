module WhitelistParamsFor
  module ControllerHelpers
    def whitelist_params_for(param, filters)
      filters.each_pair do |action, allowed_keys|
        before :only => [*action] do
          params[param].delete_if { |key, value| !allowed_keys.include?(key) }
        end
      end
    end
  end
end
