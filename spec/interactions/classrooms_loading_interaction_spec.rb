require 'rails_helper'

describe ClassroomsLoadingInteraction do
  Given(:interaction) { ClassroomsLoadingInteraction.new(params: { q: 'ардв' }) }

  describe '#as_json' do
    Given!(:right_classroom) { create :classroom, title: 'Антардвипа' }

    Given { create :classroom, title: 'Наймишаранья' }

    Given(:expected) do
      { classrooms: [{ id: right_classroom.id,
                       text: right_classroom.title }] }
    end

    Then { expect(interaction.as_json).to eq(expected) }
  end
end
