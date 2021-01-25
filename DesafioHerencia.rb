class Appointment
  attr_accessor :location, :purpose, :hour, :min
  def initialize(location, purpose, hour, min)
    if ((location.class != String) || (purpose.class != String) || (hour.class != Integer) || (min.class != Integer))
      raise ArgumentError, "El dato ingresado no corresponde"
    end
    @location = location
    @purpose = purpose
    @hour = hour
    @min = min
  end
end

class MonthlyAppointment < Appointment
  attr_accessor :day
  def initialize(location, purpose, hour, min, day)
    if ((location.class != String) || (purpose.class != String) || (hour.class != Integer) || (min.class != Integer) || (day.class != Integer))
      raise ArgumentError, "El dato ingresado no corresponde"
    end
    super(location, purpose, hour, min)
    @day = day
  end

  def occurs_on?(day)
    (@day == day)? true : false
  end

  def to_s
    return "Reunion mensual en #{@location} sobre #{@purpose} el día #{@day} a la(s) #{@hour}:#{@min}"
  end
end  

class DailyAppointment < Appointment
  def occurs_on?(hour, min)
    (@hour == hour && @min == min)? true : false
  end

  def to_s
    return "Reunion diaria en #{@location} sobre #{@purpose} a la(s) #{@hour}:#{@min}"
  end
end

class OneTimeAppointment < Appointment
  attr_accessor :day, :month, :year
  def initialize(location, purpose, hour, min, day, month, year)
    if ((location.class != String) || (purpose.class != String) || (hour.class != Integer) || (min.class != Integer) || (day.class != Integer) || (month.class != Integer) || (year.class != Integer))
      raise ArgumentError, "El dato ingresado no corresponde"
    end
    super(location, purpose, hour, min)
    @day = day
    @month = month
    @year = year
  end

  def occurs_on?(day, month, year)
    (@day == day && @month == month && @year == year)? true : false
  end

  def to_s
    return "Reunion única en #{@location} sobre #{@purpose} el #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
  end
end

one = OneTimeAppointment.new('Desafio Latam', 'Trabajo', 14, 30, 4, 6, 2019)
daily = DailyAppointment.new('Desafio Latam', 'Educación', 8, 15)
monthly = MonthlyAppointment.new('Nasa', 'Aliens', 8, 15, 23)

puts one
puts daily
puts monthly

puts one.occurs_on?(6, 7, 2020)
puts one.occurs_on?(4, 6, 2019)

puts daily.occurs_on?(9, 30)
puts daily.occurs_on?(8, 15)

puts monthly.occurs_on?(27)
puts monthly.occurs_on?(23)