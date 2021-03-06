class DogsController < ApplicationController
    def index 
        @dogs = Dog.all
    end

    def show
        @dog = Dog.find(params[:id])
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.new(dog_params(:name, :breed, :age))
        @dog.save
        redirect_to dog_path(@dog)
    end

    private

    def dog_params(*args)
		params.require(:dog).permit(*args)
	end

end
