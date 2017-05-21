require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, data|
    if season == :winter
      data.each do |attribute, value|
        value << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, holiday|
    holiday.each do |date, data|
      if date == :memorial_day
        data << supply
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, holiday|
    puts "#{season.to_s.capitalize!}:"
    holiday_string = holiday.each do |date, data|
      puts "  #{date.to_s.split('_').collect(&:capitalize).join(' ')}: #{data.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq=[]
  holiday_hash.each do |season, holiday|
    holiday.each do |date, data|
      data.each do |supply|
        bbq << date if supply == "BBQ"
      end
    end
  end
  bbq
end
