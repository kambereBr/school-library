require_relative '../models/teacher'

describe '#Teacher' do
  let(:new_teacher) { Teacher.new('Biology', 22, 'Javier') }
  it 'Should Initialize new Teacher instance with specialization, age and name properties' do
    expect(new_teacher.specialization).to eq('Biology')
    expect(new_teacher.age).to eq(22)
    expect(new_teacher.name).to eq('Javier')
  end

  it 'can_use_services? shoud return true' do
    expect(new_teacher.can_use_services?).to eq(true)
  end
end
