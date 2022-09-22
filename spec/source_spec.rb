require_relative '../source'

describe Source do
  before :each do
    @source = Source.new('Source name', '2012-02-15')
  end

  context 'When testing the Source class' do
    it 'Should create an instance of the source class' do
      expect(@source).to be_an_instance_of Source
    end
  end
end
