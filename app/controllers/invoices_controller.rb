# frozen_string_literal:true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit edit_client edit_infos update update_client update_infos destroy]

  def index
    @invoices = current_user.invoices.ordered
  end

  def show
    @client = @invoice.client
  end

  def new
    @clients = current_user.clients
    @invoice = current_user.invoices.build
  end

  def create
    @invoice = current_user.invoices.build(invoice_params)

    if @invoice.save
      redirect_to invoice_path(@invoice), notice: 'Invoice was successfully created.'
    else
      @clients = current_user.clients
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def edit_client
    @clients = current_user.clients
    @client = @invoice.client
  end

  def update_client
    if @invoice.update(invoice_params)
      @client = @invoice.client
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Invoice was successfully updated.' }
      end
    else
      render :edit_client, status: :unprocessable_entity
    end
  end

  def edit_infos; end

  def update_infos
    if @invoice.update(invoice_params)
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Invoice was successfully updated.' }
      end
    else
      render :edit_infos, status: :unprocessable_entity
    end
  end

  def destroy
    @invoice.destroy

    respond_to do |format|
      format.html { redirect_to invoices_path, notice: 'Invoice was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Invoice was successfully destroyed.' }
    end
  end

  private

  def set_invoice
    @invoice = current_user.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:name, :date, :title, :number, :client_id)
  end
end
