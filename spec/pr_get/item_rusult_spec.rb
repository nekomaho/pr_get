RSpec.describe 'ItemReuslt' do
  let(:item_dummy) { Struct.new(:number, :html_url, :title) }
  let(:item) { item_dummy.new('5', 'http:hogehoge', 'title') }
  let(:item_result) { ItemResult.new(item) }

  describe '#number' do
    subject(:number) { item_result.number }

    it { is_expected.to eq '5' }
  end

  describe '#url' do
    subject(:url) { item_result.url }

    it { is_expected.to eq 'http:hogehoge' }
  end

  describe '#title' do
    subject(:title) { item_result.title }

    it { is_expected.to eq 'title' }
  end
end
