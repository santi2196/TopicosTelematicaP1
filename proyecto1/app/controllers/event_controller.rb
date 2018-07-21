class EventController < ApplicationController
  def get_location
  	@location = Event.last(10)
end

def store
	respond_to do |format|

		latitude = params[:latitude]
		longitude = params[:longitude]

		@event = Event.new(user: current_usuario.id, x: longitude, y: latitude)

		if @event.save then 

			format.html{redirect_to event_get_location_path}

		else

			flash[:notice_booking_fail] =  true 
			redirect_to event_get_location_path
		end	
	end	


  end

def map

	@usuario_events = Event.where(user: current_usuario.id)

	@usuario_events.each do |coords|

		@link = "https://www.google.es/maps/dir/" + "'" + coords.y.to_s + "," + coords.x.to_s + "'" + "/"

	end
	
	redirect_to @link

end

end
