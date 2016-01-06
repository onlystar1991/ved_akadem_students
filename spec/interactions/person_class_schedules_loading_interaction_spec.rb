require 'rails_helper'

describe PersonClassSchedulesLoadingInteraction do
  Given(:user) { create :person }
  Given(:interaction) { PersonClassSchedulesLoadingInteraction.new(user: user, params: { page: 1 }) }

  describe 'calls ClassSchedule#personal_schedule' do
    Given(:result) { ClassSchedule.none.page(nil).per(1) }

    Then { expect(ClassScheduleWithPeople).to receive(:personal_schedule).with(user.id, 1).and_return(result) }
    And  { expect(interaction.as_json).to eq({ class_schedules: [], pages: 0 }) }
  end

  it_behaves_like :class_schedules_loadable
end
