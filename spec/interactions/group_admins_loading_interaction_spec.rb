require 'rails_helper'

describe GroupAdminsLoadingInteraction do
  Given(:interaction) { GroupAdminsLoadingInteraction.new(params: { q: 'vasy' }) }

  describe '#as_json' do
    Given!(:right_user) { create :person, name: 'Vasyl' }
    Given!(:wrong_user) { create :person }

    Given(:expected) do
      { people: [{ id: right_user.id,
                   text: right_user.complex_name,
                   imageUrl: '/assets/fallback/person/thumb_default.png' }] }
    end

    Then { expect(interaction.as_json).to eq(expected) }
  end
end
