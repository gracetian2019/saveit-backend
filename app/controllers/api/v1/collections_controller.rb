class Api::V1::CollectionsController < ApplicationController
    
    # before_action :authorized, only: [:create, :update]

    def index
        @collections = Collection.all 

        render json: @collections, status: 200
    end

    def show
        @collection = Collection.find(params[:id])
        
        render json: @collection, status: 200
    end

    def create 
        @collection = Collection.create(collection_params)
        #@collection = @user.collections.create(collection_params)

        render json: @collection, status: 200
    end

    def update
        @collection = Collection.find(params[:id])
        @collection.update(collection_params)

        render json: @collection, status: 200
    end

    def destroy
        @collection = Collection.find(params[:id])
        @collection.delete

        render json: {collectionId: @collection.id}
    end

    private

    def collection_params
        params.require(:collection).permit(:name, :category, :description, :source, :user_id)
    end
end
