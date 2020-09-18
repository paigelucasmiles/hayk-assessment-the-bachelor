require 'pry'

def get_contestants data
  data.map { |_, contetants| contetants }.flatten
end

def get_first_name_of_season_winner(data, season)
  winner = data[season].find do |contestant|
    contestant["status"] == "Winner"
      contestant["name"]
  end
  winner["name"].split[0]
end

def get_contestant_name(data, occupation)
  all_contestants = get_contestants(data)
  contestant_by_occupation = all_contestants.find do |contestant|
    contestant["occupation"] == occupation
  end
  contestant_by_occupation["name"]
end

def count_contestants_by_hometown(data, hometown)
  # .each method
  # number_from_hometown = 0
  # get_contestants(data).each do |contestant|
  #   number_from_hometown += 1 if contestant["hometown"] == hometown
  # end
  # number_from_hometown

  # .reduce
  # get_contestants(data).reduce(0) do |number_from_hometown, contestant|
  #   if contestant['hometown'] == hometown
  #     number_from_hometown + 1
  #   else
  #     number_from_hometown
  #   end
  # end

  # .select
  contestants_with_hometown = get_contestants(data).select do |contestant|
    contestant["hometown"] == hometown
  end
  contestants_with_hometown.length
end

def get_occupation(data, hometown)
  contestant_occupation_at_town = get_contestants(data).find do |contestant|
    contestant["hometown"] == hometown
  end
  contestant_occupation_at_town["occupation"]
end

def get_average_age_for_season(data, season)
  total_age = data[season].reduce(0.0) do |accumulator, contestant|
    accumulator + contestant["age"].to_i
  end
  (total_age / data[season].count).round
end