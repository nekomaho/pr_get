RSpec.describe 'SearchItem' do
  describe '#exec' do
    let(:stub_item_result){
      Struct.new(:number, :html_url, :title)
    }
    let(:github_mock) {
      double('github_mock')
    }
    let(:expect_items){
      [ stub_item_result.new('5','http://hoge','title') ]
     }

    it 'return item_results' do
      allow(github_mock).to receive_message_chain(:search, :issues, :body, :items).and_return(
        [ stub_item_result.new('5', 'http://hoge', 'title') ]
      )

      expect(PrGet::SearchItem.new(github_mock,'hoge').exec).to eq expect_items
    end
  end
end
