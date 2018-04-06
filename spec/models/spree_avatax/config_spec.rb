require 'spec_helper'

RSpec.describe SpreeAvatax::Config do
  describe 'customer_code configuration' do
    let(:order) { spy(:order) }

    after do
      described_class.customer_code = \
        described_class.send(:default_customer_code)
    end

    it 'has a sane default' do
      described_class.customer_code.call(order)

      expect(order).to have_received(:email)
    end

    it 'is be configured' do
      described_class.customer_code = ->(order) { order.number }
      described_class.customer_code.call(order)

      expect(order).to have_received(:number)
    end

    it 'raises an exception if misconfigured' do
      expect { described_class.customer_code = 'HARDCODED' }
        .to raise_error SpreeAvatax::Config::Exception
    end
  end
end
