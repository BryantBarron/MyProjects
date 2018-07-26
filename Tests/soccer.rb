=begin

Bryant Barron

2) The attached soccer.dat file contains the results from the English Premier
 League.  The columns labeled ‘F’ and ‘A’ contain the total number of goals 
 scored for and against each team in that season (so Arsenal scored 79 goals 
 against opponents, and had 36 goals scored against them). Write a program to 
 print the name of the team with the smallest difference in ‘for’ and ‘against’
  goals.
=end 


f = File.open('soccer.dat')
soccerArray = f.each.map(&:split).reject(&:empty?)
min = 120
teamName = ''

soccerArray.each do | x |
  temp = x[6].to_i
  if(temp != 0)
    m = x[6].to_i - x[8].to_i
    m = m.abs
    if(m < min)
      min = m
      teamName = x[1]
    end

  end
end
p min
p teamName
