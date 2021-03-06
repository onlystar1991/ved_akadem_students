require 'rails_helper'

describe 'Edit academic group:' do
  Given(:academic_group) { create :academic_group }

  When { login_as_admin }
  When { visit edit_academic_group_path(academic_group) }

  describe 'select elders', :js do
    Given(:prev_person) { create :person }
    Given(:curator_container) { find('.academic_group_curator span.select2-container') }
    Given(:praepostor_container) { find('.academic_group_praepostor span.select2-container') }
    Given(:administrator_container) { find('.academic_group_administrator span.select2-container') }

    Given { academic_group.update_columns(curator_id: prev_person.id,
                                          praepostor_id: prev_person.id,
                                          administrator_id: prev_person.id) }

    describe 'previous person seleced' do
      Given(:selected_person) { "span.select2-selection__rendered[title='#{prev_person.complex_name}']" }

      Then { expect(curator_container).to have_selector(selected_person) }
      And  { expect(praepostor_container).to have_selector(selected_person) }
      And  { expect(administrator_container).to have_selector(selected_person) }
    end

    describe 'select new person' do
      Given(:person) { create :person }
      Given(:selected_person) { "span.select2-selection__rendered[title='#{person.complex_name}']" }

      Given { person.create_teacher_profile }
      Given { person.create_student_profile.move_to_group(academic_group) }

      When  { curator_container.click }
      When  { find('#select2-academic_group_curator_id-results li.select2-results__option', text: person.complex_name).click }
      When  { praepostor_container.click }
      When  { find('#select2-academic_group_praepostor_id-results li.select2-results__option', text: person.complex_name).click }
      When  { administrator_container.click }
      When  { find('#select2-academic_group_administrator_id-results li.select2-results__option', text: person.complex_name).click }

      Then  { expect(curator_container).to have_selector(selected_person) }
      And   { expect(praepostor_container).to have_selector(selected_person) }
      And   { expect(administrator_container).to have_selector(selected_person) }
      And   { click_button 'Зберегти Academic group' }
      And   { expect(page).to have_selector('.alert-success') }
      And   { expect(find('.tab-pane#general tr', text: I18n.t('academic_groups.show.curator'))).to have_content(person.spiritual_name) }
      And   { expect(find('.tab-pane#general tr', text: I18n.t('academic_groups.show.praepostor'))).to have_content(person.spiritual_name) }
      And   { expect(find('.tab-pane#general tr', text: I18n.t('academic_groups.show.administrator'))).to have_content(person.spiritual_name) }
    end
  end

  describe 'When values are valid:' do
    [{ field: 'Title', value: 'БШ99-9', test_field: 'БШ99-9'},
     { field: I18n.t('activerecord.attributes.academic_group.group_description'),
       value: 'Зис из э test',
       test_field: "#{I18n.t('activerecord.attributes.academic_group.group_description')}: Зис из э test" }].each do |h|
         it_behaves_like :valid_fill_in, h, 'Academic group'
       end

    describe 'Establishment date' do
      it_behaves_like :valid_select_date, 'AcademicGroup', 'establ_date', "#{I18n.t('activerecord.attributes.academic_group.establ_date')}: "
    end
  end

  context 'When values are invalid:' do
    it_behaves_like :invalid_fill_in, { field: 'Title', value: '12-2' }, 'Academic group'
  end
end
