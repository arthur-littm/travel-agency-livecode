require_relative "base_repository.rb"
require_relative "../models/ticket.rb"

class TicketsRepository < BaseRepository
  def initialize(csv_file_path, user_repository, country_repository)
    @user_repository = user_repository
    @country_repository = country_repository
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv
  end

  def add(ticket)
    ticket.id = @next_id
    @elements << ticket
    @next_id += 1
    write_csv
  end

  def all
    @elements
  end

  def write_csv
    CSV.open(@csv_file_path, "w") do |csv|
      csv << ['id', 'country_id', 'user_id']
      @elements.each do |e|
        csv << [e.id, e.country.id, e.user.id]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      id = row[:id].to_i
      # ask user_repo which user has this id and return that user
      user = @user_repository.find(row[:user_id].to_i)
      country = @country_repository.find(row[:country_id].to_i)
      ticket = Ticket.new(id: id, user: user, country: country)
      @elements << ticket
      @next_id += 1
    end
  end
end
