class Appointment
    attr_reader :location, :purpose, :hour, :min
    def initialize(location,purpose,hour,min)
        @location = location
        @purpose = purpose
        @hour = hour
        @min = min
    end
end

class MonthlyAppointment < Appointment
    attr_reader :day
    def initialize(location, purpose, hour, min, day)
        super(location,purpose,hour,min)
        @day = day
        day()
    end

    def occurs_on?(day)
        day == @day
    end

    def to_s
        "Reunion única en #{@location} sobre #{@purpose}, el dia #{@day} a la(s) #{@hour}:#{@min}"
    end
end

class DailyAppointment < Appointment
    def occurs_on?(hour,min)
        hour == @hour && min == @min 
    end

    def to_s
        "Reunion única en #{@location} sobre #{@purpose}, a la(s) #{@hour}:#{@min}"
    end
end

class OneTimeAppointment < Appointment
    attr_reader :day, :month, :year
    def initialize(location, purpose, hour, min, day, month, year)
        super(location,purpose,hour,min)
        @day = day 
        @month = month
        @year = year
    end

    def occurs_on?(day,month,year)
        day == @day && month == @month && year == @year
    end

    def to_s
        "Reunion única en #{@location} sobre #{@purpose}, en la fecha #{@day}/#{@month}/#{@year} a la(s) #{@hour}:#{@min}"
    end
end

# Probando el polimorfismo del metodo to_s para cada subclase
puts OneTimeAppointment.new('Desafío Latam', 'Trabajo', 14, 30, 4, 6, 2019)
puts DailyAppointment.new('Desafío Latam', 'Educación', 8, 15)
puts MonthlyAppointment.new('NASA', 'Aliens', 8, 15, 23)

# Creamos citas, una por cada clase
cita_3 = OneTimeAppointment.new("Parque O'Higgins", 'Picnic Empresa', 16, 45, 14, 4, 2022)
cita_2 = DailyAppointment.new('Estacion Mapocho', 'Expo Animé', 11, 30)
cita_1 = MonthlyAppointment.new('Disney', 'Mickey', 9, 45, 27)

# Probando el metodo occurs_on?
puts cita_3.occurs_on?(22,8,2021)
puts cita_2.occurs_on?(10,30)
puts cita_1.occurs_on?(27)
