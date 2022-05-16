# frozen_string_literal:true

module InvoicesHelper
  def hide_on_pdf
    'display-none' if params[:action] == 'export_to_pdf'
  end
end
