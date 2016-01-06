require 'rails_helper'

describe 'Locales' do
  When { visit root_path }

  describe 'should be UKR by default' do
    Then { expect(find('header .nav')).to have_link(I18n.t :locale_label) }
  end
end
