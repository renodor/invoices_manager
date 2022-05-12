# frozen_string_literal:true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show edit edit_client update update_client destroy]

  def index
    @invoices = current_user.invoices.ordered
  end

  def show
    @client = @invoice.client
  end

  def new
    @invoice = current_user.invoice.build
  end

  def create
    @invoice = current_user.invoice.build(invoice_params)

    if @invoice.save
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Invoice was successfully created.' }
      end
    else
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
        format.html { redirect_to invoices_path, notice: 'Invoice client was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Invoice client was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      respond_to do |format|
        format.html { redirect_to invoices_path, notice: 'Invoice was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Invoice was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
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
    params.require(:invoice).permit(:name, :client_id)
  end
end
