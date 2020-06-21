class V1::SessionsController < ApplicationController
    # this is controller where we will be performing our authentication
    # like sign in, sign out etc.

    # Create a session : sign in
    def create
        # sign in user
       user = User.where(email: params[:email]).first;

        # check if the password is valid
        if(user&.valid_password?(params[:password])) 
            # if everything is ok, return user as json
          render json: user.as_json(only: [:name, :email, :authentication_token]), status: :created
        else
            # user's password is invalid
           head(:unauthorized)
        end

    end

    # Destroy a session : sign out.
    def destroy
        
    end
    
end