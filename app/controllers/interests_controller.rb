class InterestsController < ApplicationController


    def index 
        @topic = current_user.topics.find_by_id(params[:topic_id])
        @user = User.find_by_id(params[:user_id])
        if @topic
          @interests = @topic.interests
        elsif @user 
          @interests = current_user.interests.by_user(@user)
        else
          @interests = Interest.all
        end

      end
end
