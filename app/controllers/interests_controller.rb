class InterestsController < ApplicationController
    before_action :authenticate_user!

    def index
            @interests = current_user.interests
        end

    def new
        @interest = Interest.new
    end

    def create
        @interest = Interest.new(interest_params)
        if @interest.save
            redirect_to interest_path(@interest)
        else
            render :new
        end
    end

    def update
        if @interest.update(interest_params)
          redirect_to interest_path(@interest)
        else
          render :edit
        end
      end
    
      def destroy
        @interest.destroy
        redirect_to interests_path
      end

end
