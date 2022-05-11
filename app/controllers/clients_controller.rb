# frozen_string_literal:true

class ClientsController < ApplicationController
  def edit
    @client = Client.find(params[:id])
  end
end
