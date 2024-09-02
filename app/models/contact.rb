class Contact < ApplicationRecord
  # serialize :work_schedule, coder: YAML, type: Hash unless %i[json jsonb hstore].include?(columns_hash['work_schedule'].type)

  WORK_SCHEDULE = {
    1 => { "day" => "monday", "start" => "09:00", "end" => "19:00" },
    2 => { "day" => "tuesday", "start" => "09:00", "end" => "19:00" },
    3 => { "day" => "wednesday", "start" => "09:00", "end" => "19:00" },
    4 => { "day" => "thursday", "start" => "09:00", "end" => "19:00" },
    5 => { "day" => "friday", "start" => "09:00", "end" => "19:00" },
    6 => { "day" => "saturday", "start" => "10:00", "end" => "18:00" },
    7 => { "day" => "sunday", "start" => "", "end" => "" }
  }
end
