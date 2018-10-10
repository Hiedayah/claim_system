class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.from_states_of_event(event_name)
  	aasm.events.find {|event| event.name==event_name}.transitions.map(&:from)
  end
end
