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
	@starting_date = params[:starting][:date_1]
	@ending_date = params[:ending][:date_2]
	@usuario_events = Event.where(user: current_usuario.id)
	@result = Array.new

	@usuario_events.each do |event|

		 if((event.created_at.to_time >= @starting_date.to_time) && 
        (event.created_at.to_time <= @ending_date.to_time)) then

        @result << event
    	end
    end


	@link = "https://www.google.es/maps/dir/" 

	@result.each do |coords|

		 @link.concat("'" + coords.y.to_s + "," + coords.x.to_s + "'" + "/")

	end
	
	redirect_to @link

end

def date

end


end
