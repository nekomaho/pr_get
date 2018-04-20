RSpec.describe SearchItem do
  describe '#exec' do
    let(:stub_item_result){
      Struct.new(:number, :html_url, :title)
    }
    let(:github) {
      git_hub_mock = double('github_mock')
      allow(git_hub_mock).to receive_message_chain(:search_issues, :body, :items).and_return(
        [ stub_item_result.new('5','http://hoge','title') ]
      )
    }

    it 'return item_results' do
      let(:expect_items){
        stub_item_result.new('5','http://hoge','title')
      }

      expect(SearchItem.new(github,'hoge').exec).to eq expect_items
    end
  end
end
