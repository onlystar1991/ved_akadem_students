require 'rails_helper'

describe 'academic_groups/edit' do
  before do
    login_as_admin

    visit edit_academic_group_path(
      create(:academic_group,
             title: ag_name,
             group_description: 'some текст',
             establ_date: '2013-09-28'.to_date)
    )
  end

  subject { page }

  let(:ag_name) { 'ТВ99-1' }
  let(:title)   { ag_name }
  let(:h1)      { ag_name }
  let(:action)  { 'edit' }

  it_behaves_like 'academic group new and edit'

  describe 'default values' do
    it { is_expected.to have_selector('#academic_group_title[value="' << ag_name << '"]') }
    it { is_expected.to have_selector('#academic_group_group_description[value="some текст"]') }
    it { is_expected.to have_selector('#academic_group_establ_date_1i option[selected]', text: '2013') }
    it { is_expected.to have_selector('#academic_group_establ_date_2i option[selected]', text: 'Вересня') }
    it { is_expected.to have_selector('#academic_group_establ_date_3i option[selected]', text: '28') }
  end
end
