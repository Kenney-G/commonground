class TopicsController < ApplicationController

def topic_params
   params.require(:topic).permit(interests_attributes: [:admin, :id])
end

def index
    @topics = Topic.all
end

def show

end

def new

end

def update
    @topic = Topic.find(params[:id])
    @topic.update(topic_params)
end

def edit

end

def create
    
end

end
