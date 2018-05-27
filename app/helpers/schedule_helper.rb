module ScheduleHelper
  def event_color(schedule)
    return '#2ECC40' if diff_btw_date(schedule) < 3
    return '#001f3f' if diff_btw_date(schedule) < 8

    '#0074D9'
  end

  def diff_btw_date(schedule)
    ((schedule.date_end - schedule.date_start)*24*60*60).to_i
  end
end
