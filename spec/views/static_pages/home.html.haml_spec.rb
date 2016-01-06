require 'rails_helper'

describe 'static_pages/home' do
  Given(:new_study_application) { StudyApplication.new(person_id: user.id) }
  Given(:ag_name) { 'ТВ99-1' }
  Given(:group) { create :academic_group, { title: ag_name } }
  Given(:user) { create :person }

  Given { assign(:application_person, user) }
  Given { assign(:programs, []) }
  Given { assign(:new_study_application, new_study_application) }
  Given { allow(view).to receive(:current_person).and_return(user) }
  Given { allow(view).to receive(:policy).with(ClassSchedule).and_return(Pundit.policy(user, ClassSchedule)) }

  When  { init_schedules_mv }
  When  { render }

  describe 'user is a student' do
    Given { user.create_student_profile.move_to_group(group) }

    Then  { expect(rendered).to have_link(ag_name) }
  end

  describe 'user is not a student' do
    Then { expect(rendered).not_to have_link(ag_name) }
  end

  describe 'study applications' do
    Given(:program) { create(:program) }

    Given { assign(:programs, [program]) }

    describe 'show "apply to program" button' do
      Given(:study_application_policy) { StudyApplicationPolicy.new(user, new_study_application) }
      Given { allow(view).to receive(:policy).with(new_study_application).and_return(study_application_policy) }

      Then  { expect(rendered).to have_selector("input[type='submit'][name='commit'][value='#{I18n.t('links.apply_to_program')}']") }
      And   { expect(rendered).not_to have_link(I18n.t('links.withdraw')) }
    end

    describe 'show "withraw" link' do
      Given(:study_application_policy) { StudyApplicationPolicy.new(user, study_application) }
      Given(:study_application) { StudyApplication.create(program: program, person: user) }

      Given { allow(view).to receive(:policy).with(study_application).and_return(study_application_policy) }

      Then  { expect(rendered).to have_link(I18n.t('links.withdraw')) }
      And   { expect(rendered).not_to have_selector("input[type='submit'][name='commit'][value='#{I18n.t('links.apply_to_program')}']") }
    end
  end

  describe 'schedules' do
    Given!(:schedule) { create :class_schedule }

    describe 'ordinary user' do
      Then { expect(rendered).not_to have_content(I18n.t('static_pages.home.schedules_title')) }
    end

    describe 'student' do
      Given { user.create_student_profile.move_to_group(group) }

      context 'with schedule' do
        Given { schedule.academic_groups << group }

        Then  { expect(rendered).to have_content(I18n.t('static_pages.home.schedules_title')) }
      end

      context 'without schedule' do
        Then { expect(rendered).not_to have_content(I18n.t('static_pages.home.schedules_title')) }
      end
    end

    describe 'teacher' do
      Given!(:teacher_profile) { user.create_teacher_profile }

      context 'with schedule' do
        Given { schedule.update_column(:teacher_profile_id, teacher_profile.id ) }

        Then  { expect(rendered).to have_content(I18n.t('static_pages.home.schedules_title')) }
      end

      context 'without schedule' do
        Then { expect(rendered).not_to have_content(I18n.t('static_pages.home.schedules_title')) }
      end
    end
  end
end
