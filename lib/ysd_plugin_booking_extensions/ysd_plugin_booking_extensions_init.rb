require 'ysd-plugins' unless defined?Plugins::Plugin

Plugins::SinatraAppPlugin.register :booking_extensions do

  name=        'booking_extensions'
  author=      'yurak sisa'
  description= 'Booking extensions'
  version=     '0.1'
  hooker       YsdPluginBookingExtensions::BookingExtensionsExtension
  sinatra_extension Sinatra::YitoExtension::BookingUsersManagement
  sinatra_extension Sinatra::YitoExtension::BookingUsersManagementRestApi
  sinatra_extension Sinatra::YitoExtension::ResourcesMaintenance

end