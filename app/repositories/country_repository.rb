require 'csv'
require_relative "base_repository.rb"

require_relative "../models/country.rb"

class CountryRepository < BaseRepository
  private

  def build_element(row)
    row[:id] = row[:id].to_i
    Country.new(row)
  end

  # BEHAVIOR
  def build_row(element)
    return [element.id, element.name, element.continent]
  end

  def headers
    return ["id", "name", "continent"]
  end
end
