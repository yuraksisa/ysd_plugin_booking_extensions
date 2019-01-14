module Sinatra
  module YitoExtension
    module BookingUsersManagement
    	
      def self.registered(app)
    	  app.settings.views = Array(app.settings.views).push(
        File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..',
                                       'views')))
        app.settings.translations = Array(app.settings.translations).push(File.expand_path(File.join(File.dirname(__FILE__), '..', '..', '..', 'i18n')))

        #
        # Booking users
        #
        app.get '/admin/booking/users', :allowed_usergroups => ['booking_manager', 'staff'] do
          authorized! settings.failure_path
          # TODO User types depend on extensions installed: customers - suppliers - agents - agencies
          load_em_page :booking_users_management, nil, false
        end

      end 
    end
  end
end       	