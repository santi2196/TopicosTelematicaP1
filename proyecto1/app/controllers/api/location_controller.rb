class Api::LocationController < ApplicationController

	skip_before_action :verify_authenticity_token
  #Metodo para uno mismo autenticar :)

	def create
        #El jason llega con los siguientes metodos y se separa la informacion.

       token = params[:token]
  	   latitude = params[:latitude]
  	   longitude = params[:longitude]
  	   user = params[:user]
  	   @event = Event.new(user: user, y: latitude, x: longitude)
        #Si el usuario que usa la API tiene un TOKEN valido almacena el evento en BD
  	   if (token == Usuario.find(user).token) and @event.save

  	   		render json: @event, status: :created

  	   	else

  	   		render json: @event.errors, status: :unprocessable_entity

  	   end

	end

	private

	def location_params
     #Metodo especial de reails que solo puede recibir estos parametros. 
		params.require(:user, :token).permit(:latitude, :longitude, :user, :token)

	end


end