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

    it 'can be configured with a proc' do
      described_class.customer_code = ->(order) { order.number }
      described_class.customer_code.call(order)

      expect(order).to have_received(:number)
    end

    it 'can be configured with a value' do
      described_class.customer_code = 'value'
      expect(described_class.customer_code.call(order)).to eq 'value'
    end
  end
end
