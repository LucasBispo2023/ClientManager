class ApplicationController < ActionController::Base
    before_action :set_global_params

    def set_global_params
        $global_params = params
    end
end
