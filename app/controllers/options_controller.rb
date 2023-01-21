class OptionsController < ApplicationController
    before_action :set_query
  
    def new
      @option = @query.options.new
    end
  
    def create
      @option = @query.options.new(option_params)

      respond_to do |format|
      if @option.save
        format.html { redirect_to query_url(@query), notice: "Option was successfully created." }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
    end

    def random
        @query = Query.find(params[:query_id])
        @option = @query.options.sample
    end    
  
    private
  
    def set_query
      @query = Query.find(params[:query_id])
    end
  
    def option_params
      params.require(:option).permit(:content)
    end
  end
  