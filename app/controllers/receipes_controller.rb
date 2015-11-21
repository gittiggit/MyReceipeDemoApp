class ReceipesController < ApplicationController
    def index
      #  @receipe = Receipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
      @receipe = Receipe.all.paginate(page: params[:page], per_page: 4)
    end
    
    def show
   #  binding.pry
   @receipe  = Receipe.find(params[:id])
   
    end
    
    def new
     @receipe = Receipe.new   
    end
    
    def create
       @receipe = Receipe.new(receipe_params)
       @receipe.chef = Chef.find(2)
       
       if @receipe.save
           flash[:success] = "Your receipe is created successfully"
           redirect_to receipes_path
       else
          render :new 
       end
       
    end
    
    def edit
        @receipe = Receipe.find(params[:id])
    end
    
    def update
        @receipe = Receipe.find(params[:id])
        if @receipe.update(receipe_params)
         flash[:success] = "Your receipe is updated."
         redirect_to receipe_path(@receipe)
        else
         render :edit        
        end
    end
    def like
       @receipe = Receipe.find(params[:id])
       like = Like.create(like: params[:like], chef: Chef.first, receipe: @receipe)
       if like.valid?
          flash[:success] = "Your selection was successful"
          redirect_to :back
       else
          flash[:danger] = " you can only like/dislike a receipe once"
          redirect_to :back
       end
    end
    
    private
    def receipe_params
        params.require(:receipe).permit(:name, :summary, :description, :picture)
    end
    
end