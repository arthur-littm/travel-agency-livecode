class BaseView
  def ask_user_for(something)
    puts "#{something}?"
    return gets.chomp
  end

  def list_tickets(tickets)
    tickets.each do |t|
      puts "#{t.id} - #{t.user.username} is flying to #{t.country.name} (#{t.country.continent})"
    end
  end

  def list_users(users)
    users.each do |user|
      puts "#{user.id} - #{user.username.capitalize} [#{user.password}]"
    end
  end

  def wrong_credentials
    puts 'Wrong credentials... Try again!'
  end

  def signed_in_successfully(user)
      puts "Welcome #{user.username}!"
  end

  def list_countries(countries)
    countries.each do |c|
      puts "#{c.id} - #{c.name}, #{c.continent}"
    end
  end

  def have_a_nice_trip(user,country)
    puts "#{user.username.capitalize} have a nice trip to #{country.name}"
  end

end













