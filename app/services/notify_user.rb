# app/services/csv_reader_service.rb

require 'csv_reader_service'

class NotifyUser
  def send_email
    CsvReaderService.csv_to_hash
  end
end
