class TareasController < ApplicationController

	before_action :authenticate_usuario!, except: [:index,:show]
	#authenticate valida si ya esta el usuario logueado
	#sino lo redirige al login
	before_action :set_tarea, only: [:show,:edit,:update,:destroy]

	def index
		@tareas = Tarea.all
		#select * from tareas
	end

	def show
		#aqui se ejecuta el callback
		#@usuario= Usuario.find(@tarea.usuario_id)				
		#select * from tareas where id=:id
		@comentario = Comentario.new
	end

	def new
		@tarea = Tarea.new
	end

	def create
		@tarea = Tarea.new(
			titulo: params[:tarea][:titulo], 
			descripcion: params[:tarea][:descripcion])
		@tarea.usuario = current_usuario
		if @tarea.save						
			#insert into tareas(titulo,descripcion) values('','')
			CorreosMailer.notificar(@tarea).deliver_now
			redirect_to @tarea
		else
			render "new"
		end
	end

	def edit

	end

	def update
		if @tarea.update(
			titulo: params[:tarea][:titulo],
			descripcion: params[:tarea][:descripcion]
			)
			redirect_to @tarea
			#redirige al metodo show 
			#con el id de la tarea
		else
			render "edit"
		end
	end

	def destroy
		@tarea.destroy
		redirect_to tareas_path
		#redirige al index de tareas
	end

	private

	def set_tarea
		@tarea = Tarea.find(params[:id])
	end
end
