class ClientsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_client, only:[:show, :edit, :update, :destroy]
    before_action :params_client, only:[:update, :create]
    layout "main"


    def index
        @clients = Client.orderByName(params[:page],params[:sort || "id"])
    end

    def new
        @client = Client.new
    end

    def create
        @client = Client.new(params_client)
        if @client.save
            redirect_to clients_path, notice: t('messages.new_client_success')
        else
            redirect_to new_client_path, alert: @client.errors.full_messages
        end
    end

    def edit
    end

    def update
        if @client.update(params_client)
            redirect_to clients_path, notice: t('messages.edit_client_success')
        else
            redirect_to request.referrer, alert: @client.errors.full_messages
        end
    end

    def show
        @client = Client.first
    end

    def destroy
        if @client.destroy
            redirect_to clients_path, notice: t('messages.destroy_client')
        else
            render :index
        end
    end

    private

    def set_client
        @client = Client.find(params[:id])
    end

    def params_client
        params.require(:client).permit(:id, :first_name, :last_name, :email, :telephone, :address, :zip_code)
    end
    
end
    