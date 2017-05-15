require 'active_support/core_ext/date'
require 'active_support/core_ext/time'
require 'active_support/core_ext/array'

class Calender
  def initialize(date = Date.today)
    @date = date
  end

  def weeks
  (first_calender_day .. last_calender_day).to_a.in_groups_of(7)
  end

private

  def first_calender_day
    @date.beginning_of_month.beginning_of_week(:sunday)
  end

  def last_calender_day
    @date.end_of_month.end_of_week(:sunday)
  end

end
