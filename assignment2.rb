email_address_pattern = /[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@((?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)/

words = IO.read("assignment_two_text.txt").split(/\s+/)

domain_frequency = Hash.new(0)
words.each do |word|
  result = word.match(email_address_pattern)
  if result
    domain = result[1]
    domain_frequency[domain.downcase] += 1
  end
end
sorted_domain_frequency = domain_frequency.sort_by { |key, value| key }
sorted_domain_frequency.each { |key, value| puts "#{key}:".rjust(20) + "#{value} time(s)".rjust(12) }
