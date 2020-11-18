class UsersController < ApplicationController

def index
    @users = User.all
end

def email_required?
    false
end

end
