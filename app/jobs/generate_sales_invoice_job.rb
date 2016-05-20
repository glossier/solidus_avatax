class GenerateSalesInvoiceJob < ActiveJob::Base
  queue_as :default

  def perform(order_id)
    order = ::Spree::Order.find(order_id)
    SpreeAvatax::SalesInvoice.generate(order)
  end
end