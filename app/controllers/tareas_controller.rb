class TareasController < ApplicationController

	def index
		@tareas = Tarea.all
		#select * from tareas
	end

	def show
		@tarea = Tarea.find(params[:id])
		#select * from tareas where id=:id
	end

	def new
		@tarea = Tarea.new
	end

	def create
		@tarea = Tarea.new(
			titulo: params[:tarea][:titulo], 
			descripcion: params[:tarea][:descripcion])
		@tarea.save						
		#insert into tareas(titulo,descripcion) values('','')
		redirect_to controller: "tareas", action: "show", id: @tarea.id
	end

	def edit
	end

	def destroy
	end

end
