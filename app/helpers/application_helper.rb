module ApplicationHelper
def url_button(show: {}, edit: {}, destroy: {}, dropdown: true, confirm: true)
	if show.any?
		"Hi show"
	end
	if edit.any?
		"Hi edit"
	end
	if destroy.any?
		"Hi destroy"
	end

	if dropdown
		buttons = "<div class='dropdown'>
			<a href='dropdown-toggle' data-toggle='dropdown'>#{fa_icon('bars')}
			<span class='caret'></span></a>
			<ul class='dropdown-menu'>
		"
		if show.any?
		buttons += "<li>#{link_to "Show", show[:url]}</li>"
		end
		if edit.any?
			buttons += "<li>#{link_to "Edit", edit[:url], :remote => true, 'data-toggle' =>  "modal", 'data-target' => '#modal-window'}</li>"
		end 
		if destroy.any?
			buttons += "<li>#{link_to "Delete", destroy[:url], method: :delete, confirm: "Are you sure to delete?", remote: true}</li>"
		end

		buttons += "</ul></div>"

	end

	return buttons
end			
end
