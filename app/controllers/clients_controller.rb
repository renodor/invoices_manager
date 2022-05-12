# frozen_string_literal:true

class ClientsController < ApplicationController
  def index
    @clients = current_user.clients.all
  end

  def edit
    # @client = Client.find(params[:id])
  end
end
