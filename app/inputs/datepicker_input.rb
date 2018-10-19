class DatepickerInput < SimpleForm::Inputs::StringInput
	def input(wrapper_options)
		value = object.send(attribute_name) if object.respond_to? attribute_name
		input_html_options[:type] = 'text'
		input_html_options['data-provide'] = "datepicker"
		input_html_options[:value] ||= value.strftime('%d-%m-%Y') if value.present? 
		input_html_options[:data] ||= {}
		input_html_options[:data].merge!({'date-format' =>'dd-mm-yyyy'})
		group_class = input_html_options.delete(:group_class)
		template.content_tag :div, class: "input-group date datepicker10 #{group_class}" do
			input = super
			input += template.content_tag :span, class: 'input-group-addon' do
				template.content_tag :i, '', class: 'fa fa-calendar'
				end
				input
			end
		end
	end
