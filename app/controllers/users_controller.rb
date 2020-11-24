class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def create
        User.create!(user_params)
      end
      
      def user_params
        params.require(:user).permit(topic_ids: [])
      end
end
