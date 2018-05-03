RSpec.describe 'Client' do
  let(:client) { PrGet::Client.new(user: 'test', repo: 'test_repo', oauth_token: 'test_token') }
  let(:stub_item_result){
    Struct.new(:number, :html_url, :title)
  }
  let(:github_mock) {
    double('github_mock')
  }

  describe '#search' do
    before do
      allow(github_mock).to receive_message_chain(:search, :issues, :body, :items).and_return(
        [ PrGet::ItemResult.new(stub_item_result.new('2','http://hoge/2','title3')),
          PrGet::ItemResult.new(stub_item_result.new('1','http://hoge/1','title2')),
          PrGet::ItemResult.new(stub_item_result.new('3','http://hoge/3','title1')) ]
      )
      client.instance_variable_set('@github', github_mock)
    end

    context 'with default search key' do
      it 'return soreted item results sorted by number' do
        expect(client.search(sha: 'hogehoge').first).to be_kind_of(PrGet::ItemResult)
        expect(client.search(sha: 'hogehoge')[0].number).to eq '1'
        expect(client.search(sha: 'hogehoge')[1].number).to eq '2'
        expect(client.search(sha: 'hogehoge')[2].number).to eq '3'
      end
    end

    context 'with specify seearch key' do
      it 'return soreted item results sorted by title' do
        expect(client.search(sha: 'hogehoge').first).to be_kind_of(PrGet::ItemResult)
        expect(client.search(sha: 'hogehoge', sort_key: :title)[0].number).to eq '3'
        expect(client.search(sha: 'hogehoge', sort_key: :title)[1].number).to eq '1'
        expect(client.search(sha: 'hogehoge', sort_key: :title)[2].number).to eq '2'
      end
    end
  end
end
