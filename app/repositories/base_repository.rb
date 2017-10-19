require 'csv'

class BaseRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @elements = []
    @next_id = 1
    load_csv
  end

  def find(id)
    @elements.find { |element| element.id == id}
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  def all
    @elements
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @elements << build_element(row)
    end
    @next_id = @elements.last.id + 1
  end

  def write_csv
    csv_options = { write_headers: true, headers: @elements.first.class.headers}
    CSV.open(@csv_file_path, "w", csv_options) do |csv|
      @elements.each do |e|
        csv << build_row(e)
      end
    end
  end
end













