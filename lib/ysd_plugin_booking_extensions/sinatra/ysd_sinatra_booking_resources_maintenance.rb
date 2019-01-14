module Sinatra
  module YitoExtension
    module ResourcesMaintenance

      def self.registered(app)
    	
        #
    	# Resources maintenance
    	#
        app.get '/admin/booking/resources-maintenance', :allowed_usergroups => ['booking_manager', 'staff'] do

        	@resources = ::Yito::Model::Booking::BookingItem.all(conditions: {active: true})
          @booking_item_family = ::Yito::Model::Booking::ProductFamily.get(SystemConfiguration::Variable.get_value('booking.item_family'))
        	load_page :resources_maintenance

        end

      end  

    end
  end
end    	