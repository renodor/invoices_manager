# frozen_string_literal:true

class DaysController < ApplicationController
  def new
    @invoice = current_user.invoices.find(params[:invoice_id])
    @day = @invoice.days.build
  end

  def edit
    @invoice = current_user.invoices.find(params[:invoice_id])
    @day = @invoice.days.find(params[:id])
  end

  def update
    @invoice = current_user.invoices.find(params[:invoice_id])
    @day = @invoice.days.find(params[:id])
    if @day.update(day_params)
      respond_to do |format|
        format.html { redirect_to invoice_path(@invoice), notice: 'Day was successfully updated.' }
        format.turbo_stream { flash.now[:notice] = 'Day was successfully updated.' }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def generate_month
    @invoice = current_user.invoices.find(params[:invoice_id])
    invoice_date = @invoice.date
    (Date.new(invoice_date.year, invoice_date.month, 1)..Date.new(invoice_date.year, invoice_date.month, -1)).each do |day|
      next if [0, 6].include?(day.wday)

      @invoice.days.create(date: day)
    end

    redirect_to invoice_path(@invoice)
  end

  private

  def day_params
    params.require(:day).permit(:worked, :comment)
  end
end
