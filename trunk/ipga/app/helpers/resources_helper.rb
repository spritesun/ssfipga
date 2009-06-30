module ResourcesHelper
  ActionView::Helpers::FormBuilder.class_eval do
    def reference_data_collection_select object_name, options = {}
      text_method = options[:text_method] || :name
      collection_select "#{object_name}_id", object_name.to_s.camelize.constantize.find(:all), :id, text_method, :prompt => true
    end
  end

  def collection_select_tag method, collection, value_method, text_method, options = {}, html_options = {}
    option_tags = options[:prompt] ? content_tag(:option, options[:prompt].kind_of?(String) ? options[:prompt] : 'Please select', :value => '') : ''
    option_tags << collection.collect{ |item| content_tag :option, item.send(text_method), :value => item.send(value_method) }.join('')
    select_tag method, option_tags, html_options
  end

  # TODO: sunlong - i don't think this method is neccessary, but still finding a way to fix it out.
  def reference_data_collection_select_tag object_name, options = {}
    text_method = options[:text_method] || :name
    collection_select_tag "#{object_name}_id", object_name.to_s.camelize.constantize.find(:all), :id, text_method, :prompt => true
  end

end
