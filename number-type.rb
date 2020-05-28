require 'prime'

def divisible_by_three(n)
  n % 3 == 0
end

def divisible_by_five(n)
  n % 5 == 0
end

def number_type(n)

  if divisible_by_three(n) && divisible_by_five(n)
    type = "esotérico"
  else
    type = "cético"
  end

  is_prime = n.prime? ? "e primo" : ""

  puts "O número #{n} é #{type} #{is_prime}"
end

number_type ARGV[0].to_i
