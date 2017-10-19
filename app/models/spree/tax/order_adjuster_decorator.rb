module SpreeAvatax
  module Extensions
    module OrderAdjuster
      def adjust!
        return super unless rates_for_order_zone(order).all?(&:avatax?)

        SpreeAvatax::SalesInvoice.generate(order)
      end
    end
  end
end

::Spree::Tax::OrderAdjuster.prepend \
  ::SpreeAvatax::Extensions::OrderAdjuster
