class ClientsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_client, only:[:show, :edit, :update, :destroy]
    before_action :params_client, only:[:update, :create]

    def index
        @clients = Client.orderByName(params[:page])
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(params_client)
        if @client.save!
            redirect_to clients_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @client.update!(params_client)
            redirect_to clients_path
        else
            render :edit
        end
    end

    def show
        @client = Client.first
    end

    def destroy
        @client.destroy
        redirect_to clients_path
    end

    private

    def set_client
        @client = Client.find(params[:id])
    end

    def params_client
        params.require(:client).permit(:id, :first_name, :last_name, :email, :telephone, :address, :zip_code).merge(admin_id: current_admin.id)
    end
end
    