require 'mail'
require 'csv'
require 'find'

root_file = ARGV[0]
CSV.open("./mail.csv", "a") do |mail_csv|
    CSV.open("./tokens.csv", "a") do |tokens_csv|
	Find.find(root_file) do |file|
	    if file =~ /.*[0-9]+\.txt/
		mail = Mail.read(file)
		body = mail.body
		message_id = mail.message_id

		mail_csv << [file, mail.from, mail.to, mail.cc, mail.subject, mail.date, message_id, body]
		token_list = body.decoded.split(/[^[:alpha:]]+/)
		for token in token_list
		    if token != ""
			tokens_csv << [message_id, token.downcase]
		    end
		end
	    end
	end
    end
end
