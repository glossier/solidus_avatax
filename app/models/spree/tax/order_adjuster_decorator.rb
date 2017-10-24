module SpreeAvatax
  module Extensions
    module OrderAdjuster
      def adjust!
        super

        SpreeAvatax::SalesInvoice.generate(order) if any_avatax_rates?
      end

      private

      def any_avatax_rates?
        rates_for_order_zone(order).any?(&:avatax?)
      end
    end
  end
end

::Spree::Tax::OrderAdjuster.prepend \
  ::SpreeAvatax::Extensions::OrderAdjuster
