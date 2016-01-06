require 'rails_helper'

describe CoursesLoadingInteraction do
  Given(:interaction) { CoursesLoadingInteraction.new(params: { q: 'шко' }) }

  describe '#as_json' do
    Given!(:right_course) { create :course, title: 'Школа Бхакти' }

    Given { create :course, title: 'Университет Бхакти' }

    Given(:expected) do
      { courses: [{ id: right_course.id,
                    text: right_course.title }] }
    end

    Then { expect(interaction.as_json).to eq(expected) }
  end
end
