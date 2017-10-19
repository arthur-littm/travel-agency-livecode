require_relative '../views/base_view.rb'

class CountryController
  def initialize(country_repo)
    @repo = country_repo
    @view = BaseView.new
  end

  # -> list all the available countries
  def list
    # ask the repo for a list of all the countries
    countries = @repo.all
    # pass that list to the view to display
    @view.list_countries(countries)
  end

  # -> add a new country
  def add
    # ask the user for the country name
    new_country_name = @view.ask_user_for(:name)
    # ask the user for the country continent
    new_country_continent = @view.ask_user_for(:continent)
    # create an instance of `Country` based on what the user said
    new_country = Country.new(name: new_country_name, continent: new_country_continent)
    # adding in to the repo
    @repo.add(new_country)
  end
end














