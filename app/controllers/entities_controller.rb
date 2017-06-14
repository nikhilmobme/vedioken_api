class EntitiesController < ApplicationController
  
  def show
    @entity=Entity.find_by(:entity_type=>params[:entity_type],:entity_id=>params[:entity_id])
    if @entity
      response =  {:result => "success" }
      render json: @entity
    else
      response =  {:result => "failure" }
      render json: response
    end
  end 

 def create
   @entity = Entity.new(entity_params)
   if @entity.save
    puts "success"
    response =  {:result => "success" }
   else
     response =  {:result => "failure" }
   end
    render json: response
 end
 
 def destroy
  if @entity=Entity.find_by(:entity_type=>params[:entity_type],:entity_id=>params[:entity_id])
     @entity.destroy
    response =  {:result => "success" }
  else
    response =  {:result => "failure" }
  end
    render json: response
  end
  
  def status_entity
    @entity=Entity.select("entity_type").where(:entity_type=>params[:entity_type],:entity_id=>params[:entity_id])
    stats=Hash.new
    stats={"entity_type"=>params[:entity_type],"count"=>@entity.count}
    render json: stats
  end

  def status_all
    @stats=Entity.group('entity_tags').count('entity_tags')
    status=[]
    @stats.each do|x, y|
      status << {"tag"=>x,"count"=>y}
    end
    render json: status
  end

  private
  def entity_params
      params.permit(:entity_type, :entity_id, :entity_tags)
  end
end