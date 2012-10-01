require 'csv'

state_list = ['alabama', 'alaska', 'arizona', 'arkansas', 'california', 'colorado', 'connecticut', 'delaware', 'florida', 'georgia', 'hawaii', 'idaho', 'illinois', 'indiana', 'iowa', 'kansas', 'kentucky', 'louisiana', 'maine', 'maryland', 'massachusetts', 'michigan', 'minnesota', 'mississippi', 'missouri', 'montana', 'nebraska','nevada', 'hampshire', 'jersey', 'mexico', 'york', 'carolina', 'dakota', 'ohio', 'oklahoma', 'oregon', 'pennsylvania', 'rhode', 'tennessee', 'texas', 'utah', 'vermont', 'virginia', 'washington', 'wisconsin', 'wyoming']

CSV.open('./state_counts.csv', 'a') do |state_csv|
    File.readlines("./token_counts.csv").each do |pair|
	token = pair.split(',')[0]
	count = pair.split(',')[1].strip()
        if state_list.include?(token)
	        state_csv << [token, count] 
	    end
    end
end
