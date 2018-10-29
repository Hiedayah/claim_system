class DatepickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options)
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_options[:type] = 'text'
    input_html_options[:data] ||= {}
    input_html_options[:value] ||= value.strftime('%d-%m-%Y') if value.present? 
    input_html_options[:data].merge!({'date-format' =>'d-m-Y'})
    group_class = input_html_options.delete(:group_class)    
    template.content_tag :div, class: "input-group date flatpickr-date-time" do
      input = super
      input += template.content_tag :span, class: 'input-group-addon', data: {toggle: true} do
        template.content_tag :span, 'today', class: 'material-icons'
      end
      input
    end
  end
end

