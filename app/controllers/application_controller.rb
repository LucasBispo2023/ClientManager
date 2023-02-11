class ApplicationController < ActionController::Base
    before_action :set_global_params
    add_flash_types :alert_error

    def set_global_params
        $global_params = params
    end
end
