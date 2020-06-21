class Ticket < ApplicationRecord
    before_save :default_values


    def default_values
        #set generate ticket token for new ticket.
        token = (0...8).map { (65 + rand(26)).chr }.join
        #self.isClose ||= false
        self.ticket_token ||= token
    end
end
