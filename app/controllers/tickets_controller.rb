require_relative '../views/base_view.rb'
require_relative '../models/ticket.rb'

class TicketsController
  def initialize(tickets_repository, country_repository, user_repository)
    @tickets_repository = tickets_repository
    @country_repository = country_repository
    @user_repository = user_repository
    @view = BaseView.new
  end

  def list
    tickets = @tickets_repository.all
    @view.list_tickets(tickets)
  end

  def add
    countries = @country_repository.all
    @view.list_countries(countries)
    # Ask for a country_id
    country_id = @view.ask_user_for("country_id please").to_i
    # From the given id return the Country wanted
    country = @country_repository.find(country_id)
    # Ask for a user_id
    users = @user_repository.all
    @view.list_users(users)
    user_id = @view.ask_user_for("user_id please").to_i
    # From the given id return the User wanted
    user = @user_repository.find(user_id)
    # Ticket.new send that to repo
    @tickets_repository.add(Ticket.new({user: user, country: country}))
    @view.have_a_nice_trip(user, country)
  end
end
