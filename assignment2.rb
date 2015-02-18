email_address_pattern = /[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@((?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)/
rjust_num = 13

words = File.readlines('assignment_two_text.txt').to_s.split(/\s+/)

domain_frequency = Hash.new(0)
words.each do |word|
  result = word.match(email_address_pattern)
  if result
    domain = result[1]
    domain_frequency[domain.downcase] += 1
  end
end

domain_frequency.sort_by { |key, value| key }.each do |domain|
  puts "#{domain[0]}: ".rjust(rjust_num) + "#{domain[1]} time(s)".rjust(rjust_num)
end