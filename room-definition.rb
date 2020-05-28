require 'date'

######## Rooms designation ######## 
# Sala 1: Até 25 anos 2 meses e 15 dias (9207 dias)
# Sala 2: De 25 anos 2 meses e 16 dias (9027 dias) até 45 anos e 1 mês (16467 dias)
# Sala 3: De 45 anos 1 mês e 1 dia (16468) até 65 anos (23741 dias)
# Sala 4: Acima de 65 anos (23741 dias)

@rooms = [
  {min: 0, max: 9207, name: "Sala 1"},
  {min: 9208, max: 16467, name: "Sala 2"},
  {min: 16468, max: 23741, name: "Sala 3"}
]

def wich_room(bday)
  begin
  bday_converted = Date::strptime(bday, "%d/%m/%Y")
  rescue
    puts "Date format is wrong. Correct format is: 'DD/MM/AAAA'" 
    return
  end

  today = Date.today
  age_in_days = (today - bday_converted).to_i

  if age_in_days > 23741
    room_name = "Sala 4"
  else
    room = @rooms.find{ |r| age_in_days >= r[:min] && age_in_days <= r[:max]}
    room_name = room[:name]
  end
  
  puts room_name
end

wich_room ARGV[0]