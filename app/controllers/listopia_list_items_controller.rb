module ListopiaListItemsController
  # Base functionality of ListItems Controller
  #
  # class ListItemsController < ApplicationController
  #   include ListopiaListItemsController::Base
  # end
  module Base
    extend ActiveSupport::Concern
    # GET /list_items
    # GET /list_items.json
    def index
     @list_items = ListItem.all

     respond_to do |format|
       format.html { render "listopia/list_items/index"}
       format.json { render json: @list_items }
     end
    end

    # GET /list_items/1
    # GET /list_items/1.json
    def show
     @list_item = ListItem.find(params[:id])

     respond_to do |format|
       format.html { render "listopia/list_items/show"}
       format.json { render json: @list_item }
     end
    end

    # GET /list_items/new
    # GET /list_items/new.json
    def new
     @list_item = ListItem.new

     respond_to do |format|
       format.html { render "listopia/list_items/new"}
       format.json { render json: @list_item }
     end
    end

    # GET /list_items/1/edit
    def edit
     @list_item = ListItem.find(params[:id])
     respond_to do |format|
       format.html { render "listopia/list_items/edit"}
       format.json { render json: @list_item }
     end
    end

    # POST /list_items
    # POST /list_items.json
    def create
     @list_item = ListItem.new(params[:list_item])
     
     respond_to do |format|
       if @list_item.list.add(@list_item.resource)
         format.html { redirect_to @list_item.list, notice: 'List item was successfully created.' }
         format.json { render json: @list_item.list, status: :created, location: @list_item }
       else
         format.html { render action: "new" }
         format.json { render json: @list_item.errors, status: :unprocessable_entity }
       end
     end
    end

    # PUT /list_items/1
    # PUT /list_items/1.json
    def update
     @list_item = ListItem.find(params[:id])

     respond_to do |format|
       if @list_item.update_attributes(params[:list_item])
         format.html { redirect_to @list_item, notice: 'List item was successfully updated.' }
         format.json { head :no_content }
       else
         format.html { render action: "edit" }
         format.json { render json: @list_item.errors, status: :unprocessable_entity }
       end
     end
    end

    # DELETE /list_items/1
    # DELETE /list_items/1.json
    def destroy
     @list_item = ListItem.find(params[:id])
     @list_item.destroy

     respond_to do |format|
       format.html { redirect_to list_items_url }
       format.json { head :no_content }
     end
    end
    
    def sort
      params[:list_item].each_with_index do |id, index|
        ListItem.update_all(['position=?', index+1], ['id=?', id])
      end
      respond_to do |format|
        format.html {redirect_to "/lists/#{params[:list_id]}"}
        format.json {head :no_content}
      end      
    end

  end#Base
end
