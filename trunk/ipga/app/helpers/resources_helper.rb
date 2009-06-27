module ResourcesHelper
  ActionView::Helpers::FormBuilder.class_eval do
    def reference_data_collection_select object_name, options = {}
      text_method = options[:text_method] || :name
      collection_select "#{object_name}_id", object_name.to_s.camelize.constantize.find(:all), :id, text_method, :prompt => :true
    end
  end
end
