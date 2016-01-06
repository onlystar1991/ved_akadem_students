require 'rails_helper'

describe Questionnaire do
  describe 'association' do
    Then { is_expected.to have_many(:questions).dependent(:destroy) }
    Then { is_expected.to have_many(:questionnaire_completenesses).dependent(:destroy) }
    Then { is_expected.to have_many(:people).through(:questionnaire_completenesses) }
    Then { is_expected.to have_and_belong_to_many(:programs) }
  end

  describe 'validations' do
    Then { is_expected.to validate_presence_of(:title_uk) }
    Then { is_expected.to validate_presence_of(:title_ru) }
  end
end
