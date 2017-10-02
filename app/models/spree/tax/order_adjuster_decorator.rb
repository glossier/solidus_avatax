module SpreeAvatax
  module Extensions
    module Tax
      module OrderAdjuster
        def adjust!
          # do nothing. we hook in in our own ways.
          # TODO: See if we can make OrderAdjuster pluggable and workable for what we
          # need to do.
        end
      end
    end
  end
end

::Spree::Tax::OrderAdjuster.prepend \
  SpreeAvatax::Extensions::Tax::OrderAdjuster
