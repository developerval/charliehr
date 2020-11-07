require 'date'

CURRENT_YEAR = Date.today.year
CURRENT_MONTH = Date.today.month
CURRENT_DAY = Date.today.day

class User
    attr_reader :name, :date_of_birth

    def initialize(name, date_of_birth)
        @name = name
        @date_of_birth = date_of_birth
    end

    # Returns an Integer representing the user’s current age
    def age
        birthday_in_past? ? CURRENT_YEAR - @date_of_birth.year : CURRENT_YEAR - @date_of_birth.year - 1
    end

    # Returns a Date object for the user's current upcoming birthday
    def next_birthday
        Date.new(CURRENT_YEAR + current_year_addition?, @date_of_birth.month, @date_of_birth.day)
    end

    private

    def current_year_addition?
        birthday_in_past? ? 1 : 0
    end

    def birthday_in_past?
        CURRENT_MONTH >= @date_of_birth.month && CURRENT_DAY >= @date_of_birth.day
    end
end


tests = [
    Date.new(1986, 1, 1),
    Date.new(1988, Date.today.month, Date.today.day),
    Date.new(1990, 12, 30),
]

puts "====== ages ======"
tests.each do |date|
    puts "#{date} => #{User.new("Test", date).age}"
end

puts "====== birthdays ======"
tests.each do |date|
    puts "#{date} => #{User.new("Test", date).next_birthday}"
end