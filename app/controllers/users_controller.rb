class UsersController < ApplicationController
    
    def index
        
        if current_user.nil?
            @all_photos = Photo.new
            @all_photos.user_id = -1 #dummy user_id
            #dummy image
            @all_photos.image = "https://as1.ftcdn.net/jpg/01/40/46/18/500_F_140461899_dvRngd7xvZtqCUHLiIyRjgflq2EmwnVP.jpg"
            @all_photos.save
        else
            @all_photos = Photo.find(current_user.id)
        end
        
        render("user_templates/index.html.erb")
    end

end