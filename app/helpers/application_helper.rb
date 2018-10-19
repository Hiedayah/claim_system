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
  if current_staff.admin? && current_staff.admin_view?

    if dropdown
        buttons = ""
        if show.any?
        buttons += "<a href='#{show[:url]}' data-remote='true' data-target='#modal-window' data-toggle='modal'>#{fa_icon 'search-plus'}</a>"
        buttons+= "<span style='padding-right:30px'></span>"
        end
        if edit.any?
          buttons += "<a href='#{edit[:url]}' data-remote='true' data-target='#modal-window' data-toggle='modal'>#{fa_icon 'pencil'}</a>"
          buttons+= "<span style='padding-right:30px'></span>"
        end 
        if destroy.any?
          buttons += "<a href='#{destroy[:url]}' data-remote='true' data-method='delete'>#{fa_icon 'trash'}</a>"
        end

        buttons += "</ul></div>"
      end
  else
    if dropdown
      buttons = ""
      if show.any?
      buttons += "<a href='#{show[:url]}'>#{fa_icon 'search-plus'}</a>"
      buttons+= "<span style='padding-right:30px'></span>"
      end
      if edit.any?
        buttons += "<a href='#{edit[:url]}' data-remote='true' data-target='#modal-window' data-toggle='modal'>#{fa_icon 'pencil'}</a>"
        buttons+= "<span style='padding-right:30px'></span>"
      end 
      if destroy.any?
        buttons += "<a href='#{destroy[:url]}' data-remote='true' data-method='delete'>#{fa_icon 'trash'}</a>"
      end

      buttons += "</ul></div>"
    end
  end

	# if dropdown
	# 	buttons = "<div class='dropdown'>
	# 		<a href='dropdown-toggle' data-toggle='dropdown'>#{fa_icon('bars')}
	# 		<span class='caret'></span></a>
	# 		<ul class='dropdown-menu'>
	# 	"
	# 	if show.any?
	# 	buttons += "<li>#{link_to "Show", show[:url]}</li>"
	# 	end
	# 	if edit.any?
	# 		buttons += "<li>#{link_to "Edit", edit[:url], :remote => true, 'data-toggle' =>  "modal", 'data-target' => '#modal-window'}</li>"
	# 	end 
	# 	if destroy.any?
	# 		buttons += "<li>#{link_to "Delete", destroy[:url], method: :delete, confirm: "Are you sure to delete?", remote: true}</li>"
	# 	end

	# 	buttons += "</ul></div>"

	# end

	return buttons
end

def error_panel(object)
	errors = "<div class='panel panel-danger'><div class='panel-heading'>Error: </div><div class='panel-body'><ul>"
	object.errors.full_messages.each do |msg|
		errors += "<li>#{msg[:message]}</li>"
	end
	errors += "</ul></div></div>"

	return errors.html_safe
	
end			
end
