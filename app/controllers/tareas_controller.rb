class TareasController < ApplicationController

	def index
		@tareas = Tarea.all
		#select * from tareas
	end

end
