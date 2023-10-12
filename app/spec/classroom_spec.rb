require_relative '../models/classroom'

describe '#Classroom' do
  let(:new_classroom) { Classroom.new('Programming') }
  let(:new_student) { Student.new('2A', 22, 'Javier') }

  it 'Should initialize a new classroom' do
    expect(new_classroom.label).to eq('Programming')
  end

  it 'add_student should add a new student to the classroom' do
    new_classroom.add_student(new_student)
    expect(new_classroom.student[0]).to eq(new_student)
  end
end
