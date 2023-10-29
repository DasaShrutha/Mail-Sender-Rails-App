# app/services/csv_reader_service.rb

require 'csv'

class CsvReaderServiceForEnhancements
  FILE_PATH = './Enhancement-Company-Names-Mail-List.csv'

  @@arr = []
  def CsvReaderServiceForEnhancements.csv_to_hash
    CSV.foreach(FILE_PATH, headers: true) do |row|
      # sleep(180) if @@email_number % 19 == 0

      details = {
        company_name: row["Company Name"],
        email: row["Email"].strip
      }

      UserMailer.enhancements_email(details).deliver_now
      # @@email_number += 1
    rescue StandardError, Exception => e
      @@arr << "Error for #{row['Email']} --> #{e}"
    end

    puts @@arr
  end
end
