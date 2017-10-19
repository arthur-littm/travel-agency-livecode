require_relative "app/repositories/tickets_repository"
require_relative "app/repositories/user_repository"
require_relative "app/repositories/country_repository"
c_repo = CountryRepository.new('data/countries.csv')
u_repo = UserRepository.new('data/users.csv')
t_repo = TicketsRepository.new('data/tickets.csv', u_repo, c_repo)

p t_repo.all
