class CreateClassSchedules < ActiveRecord::Migration
  def change
    create_table :class_schedules do |t|

      t.timestamps
    end
  end
end
