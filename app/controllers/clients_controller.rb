class ClientsController < ApplicationController
    before_action :authenticate_admin!

    def new
        @client
    end
end
