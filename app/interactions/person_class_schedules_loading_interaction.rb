class PersonClassSchedulesLoadingInteraction < BaseInteraction
  include ClassSchedulesLoadable

  def init
    #TODO replace this when ElasticSearch appears
    #injection is possible!
    @class_schedules = ClassScheduleWithPeople.personal_schedule(user.id, params[:page])
  end
end
