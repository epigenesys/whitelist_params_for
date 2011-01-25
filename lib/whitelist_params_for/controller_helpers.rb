module WhitelistParamsFor
  module ControllerHelpers
    def whitelist_params_for(param, filters)
      filters.each_pair do |action, allowed_keys|
        allowed_keys.map!(&:to_sym)
        before_filter :only => [*action] do
          params[param].delete_if { |key, value| !allowed_keys.include?(key.to_sym) }
        end
      end
    end
  end
end
