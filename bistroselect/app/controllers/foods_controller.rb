class FoodsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
        @foods = Food.all
        if params[:tag_ids]
          @foods = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_foods = Tag.find_by(name: key).foods
              @foods = @foods.empty? ? tag_foods : @foods & tag_foods
            end
          end
        end

        if params[:tag]
          Tag.create(name: params[:tag])
        end
    end
    
    def top
    end

    def new
        @food = Food.new
      end
    
      def create
        food = Food.new(food_params)
        food.user_id = current_user.id
        if food.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
    
      def show
        @food = Food.find(params[:id])
        
      end

      def edit
        @food = Food.find(params[:id])
      end

      def update
        food = Food.find(params[:id])
        if food.update(food_params)
          redirect_to :action => "show", :id => food.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to action: :index
      end

      def tag
        @foods = []
        if params[:tag_ids]
          params[:tag_ids].each do |value|
            tag_foods = Tag.find(value.to_i).foods
            @foods = @foods.empty? ? tag_foods : @foods & tag_foods
          end
        end
      end

      private

      def food_params
        params.require(:food).permit(:name, :food_genre, :address, :about, :image, :bistro_genre, :lat, :lng, :image_top, images: [], tag_ids: [])
      end
    end