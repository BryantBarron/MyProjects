=begin

Bryant Barron


Programming test 1
1) In the attached file (w_data.dat), you’ll find daily weather data.
 Download this text file, then write a program to output the day number
 (column one) with the smallest temperature spread (the maximum temperature
  is the second column, the minimum the third column).
=end

require 'csv'
date = 0
minimum = 140
CSV.foreach('w_data.csv', headers: true).with_index(1) do |row, rowno|
  next if rowno < 5
  mini = row[1].to_i - row[2].to_i
  if (mini < minimum)
    minimum = mini
    date = row[0].to_i
  end
end

p date
