class ReceipesController < ApplicationController
    def index
        @receipe = Receipe.all
    end
    def show
     #   @receipe_current = Receipe.find(receipe_params[:id])
   #  binding.pry
   @receipe  = Receipe.find(params[:id])
    end
    
    def new
     @receipe = Receipe.new   
    end
    
    def create
        
    end
    
    private
    def receipe_params
        params.require(:receipe).permit(:name, :summary)
    end
    
end