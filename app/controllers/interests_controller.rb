class InterestsController < ApplicationController

    def index
            @interests = current_user.interests
            
        end
    end

end
