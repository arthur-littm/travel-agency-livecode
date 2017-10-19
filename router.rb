class Router
  def initialize(c_controller, u_controller, t_controller)
    @country_controller = c_controller
    @user_controller = u_controller
    @tickets_controller = t_controller
    @running = true
  end

  def run
    while @running
      print_travel_agent_menu
      action = ask_user_for_action
      route_travel_agent_action(action)
    end
  end

  private

  # TRAVEL AGENT

  def print_travel_agent_menu
    puts "1. list countries"
    puts "2. add country"
    puts "3. list users"
    puts "4. add user"
    puts "5. list all tickets"
    puts "6. add ticket"
  end

  def route_travel_agent_action(action)
    case action
    when 1 then @country_controller.list
    when 2 then @country_controller.add
    when 3 then @user_controller.list
    when 4 then @user_controller.add
    when 5 then @tickets_controller.list
    when 6 then @tickets_controller.add
    else
      puts "wrong choice!"
    end
  end


  def ask_user_for_action
    puts "what do you want to do?"
    return gets.chomp.to_i
  end

  # CUSTOMER

  # def print_customer_menu
  #   puts "1. List my tickets"
  #   puts "2. Buy a ticket"
  # end

  # def route_customer_action(action)
  #   case action
  #   when 1 then "TODO list user tickets"
  #   when 2 then "TODO buy a ticket"
  #   else
  #     puts "wrong choice!"
  #   end
  # end

end
