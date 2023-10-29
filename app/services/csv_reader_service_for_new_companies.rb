# app/services/csv_reader_service_for_new_companies.rb

require 'csv'

class CsvReaderServiceForNewCompanies
  FILE_PATH = './New-Company-Names-Mail-List.csv'

  @@arr = []
  @@email_number = 1
  def CsvReaderServiceForNewCompanies.csv_to_hash
    CSV.foreach(FILE_PATH, headers: true) do |row|
      sleep(180) if @@email_number % 19 == 0

      details = {
        company_name: row["Company Name"],
        email: row["Email"].strip
      }

      UserMailer.new_website_email(details).deliver_now
      @@email_number += 1

    rescue StandardError, Exception => e
      @@arr << "Error for #{row['Email']} --> #{e}"
    end

    puts @@arr
  end
end
