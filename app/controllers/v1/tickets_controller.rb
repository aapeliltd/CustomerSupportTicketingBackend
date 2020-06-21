class V1::TicketsController < ApplicationController
  
    def index
        @tickets = Ticket::all
        render json: @tickets, status: :ok
    end

    # Create a new ticket. this is done by customer and 10 random of alphanumeric
    # will be generate upon successful creation of ticket.
    def create
        @ticket = Ticket.new(ticket_params)

        @ticket.save 

        render json: @ticket, status: :created
    end
    
    # closing of ticket method, this operation can be both perform by customer and support agent
    def close 
        @ticket = Ticket.where(id: params[:id]).first 

        @ticket.isClose = true

        # if operation was successful return an okay header otherwise return unprocessable entity error
        if @ticket.save 
            head(:ok)
        else
            head(:unprocessable_entity)
        end

       
    end

   


    private
    def ticket_params
       params.require(:ticket).permit(:user_id, :title, :body)
    end
end
