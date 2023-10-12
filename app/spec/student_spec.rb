require_relative '../models/student'

describe '#Student' do
  let(:new_student) { Student.new('2A', 22, 'Javier') }
  it 'Should Initialize new Student instance with classroom, age and name properties' do
    expect(new_student.classroom).to eq('2A')
    expect(new_student.age).to eq(22)
    expect(new_student.name).to eq('Javier')
  end

  it 'play_hooky shoud return "¯(ツ)/¯"' do
    expect(new_student.play_hooky).to eq('¯(ツ)/¯')
  end
end
