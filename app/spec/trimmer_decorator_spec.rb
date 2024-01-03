require_relative '../models/trimmer_decorator'

describe '#TrimmerDecorator' do
  let(:person) { Person.new(22, 'JavierAybar') }
  let(:new_trimmer) { TrimmerDecorator.new(person) }
  it 'Should trim JavierAybar and return JavierAyba' do
    expect(new_trimmer.correct_name).to eq('JavierAyba')
  end
end
