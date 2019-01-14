module Sinatra
  module YitoExtension
    module BookingUsersManagementRestApi
    	
      def self.registered(app)
         
        #
        # Profiles search
        #
        ["/api/booking/users","/api/booking/users/page/:page"].each do |path|
          app.post path, :allowed_usergroups => ['booking_manager', 'staff'] do
            data, total = Users::Profile.all_and_count
            data = data.map do |user| 
              user_type = if user.belongs_to?('booking_manager') 
                            'manager' 
                          elsif user.belongs_to?('booking_operator') 
                            'operator'
                          elsif user.belongs_to?('booking_customer') 
                            'customer'
                          elsif user.belongs_to?('booking_supplier') 
                            'supplier'
                          elsif user.belongs_to?('booking_agent')  
                            'agent'
                          elsif user.belongs_to?('booking_agency') 
                            'agency'
                          elsif user.belongs_to?('booking_charge_supplier')
                            'charge_supplier'  
                          elsif user.belongs_to?('webmaster')
                            'webmaster'  
                          end  
              {username: user.username, full_name: user.full_name, email: user.email, api_key: user.api_key, api_secret: user.api_secret,
               creation_date: user.creation_date, last_access: user.last_access, 
               user_type: user_type} 
            end           
            content_type :json
            {:data => data, :summary => {:total => total}}.to_json
          end
        end
        
        #
        # Creates a new user profile
        #  
        app.post "/api/booking/user", :allowed_usergroups => ['booking_manager', 'staff'] do
          
          profile = Users::RegisteredProfile.create(body_as_json(Users::RegisteredProfile))           
                    
          status 200
          content_type :json
          profile.to_json          
        
        end
        
        #
        # Updates an user profile
        #
        app.put "/api/booking/user", :allowed_usergroups => ['booking_manager', 'staff'] do
          
          profile_request = body_as_json(Users::RegisteredProfile)

          if profile = Users::Profile.get(profile_request[:username])
            profile.attributes=(profile_request)
            profile.save
          end
          
          content_type :json
          profile.to_json
        
        end

        #
        # Deletes an user profile
        #        
        app.delete "/api/booking/user", :allowed_usergroups => ['booking_manager', 'staff'] do
        
          profile_request = body_as_json(Users::RegisteredProfile)

          if profile = Users::Profile.get(profile_request[:username])
            profile.destroy
          end
          
          content_type :json
          true.to_json

        end

        #
        # Generates the api key for an user
        #
        app.post '/api/booking/user/:username/generate-api-key', :allowed_usergroups => ['booking_manager', 'staff'] do

          if user = Users::Profile.get(params[:username])
            user.api_key = Users::Profile.generate_key
            user.save
            content_type :json
            user.to_json
          else
            status 404
          end 

        end

        #
        # Generates the api secret for an user
        #
        app.post '/api/booking/user/:username/generate-secret-key', :allowed_usergroups => ['booking_manager', 'staff'] do

          if user = Users::Profile.get(params[:username])
            user.api_secret = Users::Profile.generate_key
            user.save
            content_type :json
            user.to_json
          else
            status 404
          end 

        end

      end 

    end
  end
end       	