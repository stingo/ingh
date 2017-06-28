class MainController < ApplicationController
def index

  


  if params[:tag]

 @hows = How.order("created_at desc").tagged_with(params[:tag])#.paginate(:page => params[:page], :per_page => 3)
 @urban_terms = UrbanTerm.order("created_at desc").tagged_with(params[:tag])

 else

  @hows = How.all

  @urban_terms = UrbanTerm.all

end   
  
#elsif query = params[:q].presence || "*"
      #@hows = How.search(query)#, page: params[:page], per_page: 2)




#else
  #@dhows = How.all.order("created_at desc")#.paginate(:page => params[:page], :per_page => 3)
  

    
  #end


    #@urban_terms = UrbanTerm.search(query)

     #@urban_terms = UrbanTerm.all
  end

  def search
    @hows = How.ransack(title_cont: params[:q]).result(distinct: true)
    @urban_terms = UrbanTerm.ransack(title_cont: params[:q]).result(distinct: true)

    respond_to do |format|
      format.html {}
      format.json {
        @hows = @hows.limit(5)
        @urban_terms = @urban_terms.limit(5)
      }
    end
  end
end



