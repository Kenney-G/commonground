class UsersController < ApplicationController
    def index
    end
    def current_user.username
        email = current_user.email
        un = self.email.split(/@/)[0]
        if User.all.username.includes? == un
          self.username = self.email
          else    
            self.username = un
          end   
        end    

end
