# frozen_string_literal:true

class LineItemsController < ApplicationController
  before_action :set_invoice
  before_action :set_line_item, only: %i[edit update destroy]

  def new
    @line_item = @invoice.line_items.new
  end

  def create
    @line_item = @invoice.line_items.build(line_item_params)

    if @line_item.save
      respond_to do |format|
        format.html { redirect_to invoice_path(@invoice), notice: 'Item was successfully created.' }
        format.turbo_stream { flash.now[:notice] = 'Item was successfully created.' }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @line_item.update(line_item_params)
      respond_to do |format|
        format.html { redirect_to invoice_path(@invoice), notice: 'Item was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Item was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to invoice_path(@invoice), notice: 'Item was successfully destroyed.' }
      format.turbo_stream { flash.now[:notice] = 'Item was successfully destroyed.' }
    end
  end

  private

  def line_item_params
    params.require(:line_item).permit(:description, :quantity, :unit_price)
  end

  def set_invoice
    @invoice = current_user.invoices.find(params[:invoice_id])
  end

  def set_line_item
    @line_item = @invoice.line_items.find(params[:id])
  end
end
