#
# Booking Extensions
#
module YsdPluginBookingExtensions

  class BookingExtensionsExtension < Plugins::ViewListener


    # ========= Installation =================

    #
    # Install the plugin
    #
    def install(context={})

      unless concepts_taxonomy = Yito::Model::Classifier::ClassifierTaxonomy.first({name: 'customer_invoice_concepts'})
      		concepts_taxonomy = Yito::Model::Classifier::ClassifierTaxonomy.create({name: 'customer_invoice_concepts',
      																				description: 'Predefined concepts for customer invoice'})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Alquiler de vehículos', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Cambio de Vehículo', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Conductor Joven', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Conductor adicional', 
      														classifier_taxonomy: concepts_taxonomy})      														      		
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Tasa administrativa', 
      														classifier_taxonomy: concepts_taxonomy}) 
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Repostaje', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Multa de tráfico', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Extras', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Pérdida de llaves', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Daños interior del vehículo', 
      														classifier_taxonomy: concepts_taxonomy})
      		Yito::Model::Classifier::ClassifierTerm.create({name: 'Reparación de Daños', 
      														classifier_taxonomy: concepts_taxonomy})         														      														         														         														       														        														 
      end		


    end

  end
end