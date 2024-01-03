require_relative '../models/decorator'
require_relative '../models/nameable'

describe '#Decorator' do
  let(:new_nameable) { double('Nameable', correct_name: 'Javier') }
  let(:new_decorator) { Decorator.new(new_nameable) }
  it 'Should initialize new Decorator instance with nameable property' do
    expect(new_decorator.nameable).to eq(new_nameable)
  end

  it 'correct_name should return Javier' do
    expect(new_decorator.correct_name).to eq('Javier')
  end
end
