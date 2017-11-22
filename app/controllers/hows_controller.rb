class HowsController < ApplicationController


  before_action :authenticate_profile!, :except => [:index, :show]

  before_action :set_how, only: [:show, :edit, :update, :destroy]

  impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /hows
  def index


if params[:tag]

 @hows = How.order("created_at desc").tagged_with(params[:tag]).paginate(:page => params[:page], :per_page => 3)

 

  
#elsif query = params[:q].presence || "*"
      #@hows = How.search(query)#, page: params[:page], per_page: 2)




else
  #@dhows = How.all.order("created_at desc")#.paginate(:page => params[:page], :per_page => 3)
  
@hows = How.all.order("created_at desc").paginate(:page => params[:page], :per_page => 3)
    
  end


    #@urban_terms = UrbanTerm.search(query)

     #@urban_terms = UrbanTerm.all

  end



def require_same_profile

if current_profile != @how.profile and !current_profile.admin?

flash[:danger] = "You can only edit or delete your own articles"

redirect_to root_path

end

end




  #def search
    #respond_to do |format|
      #format.html
      #format.json { @hows = How.search(params[:term]) }
    #end
  #end

  # GET /hows/1
  # GET /hows/1.json
  def show
    impressionist(@how)
    @how = How.friendly.find(params[:id])
   
    #@new_comment = Comment.new

if current_profile.present?

    @new_comment = Comment.build_from(@how, current_profile.id, "")

else

end



  end

  # GET /hows/new
  def new
    @how = How.new
    #@tag = Tag.new
  end

  # GET /hows/1/edit
  def edit
    #@tag = Tag.new
  end

  # POST /hows
  # POST /hows.json
  def create
    #@how = How.new(how_params)



    @how = current_profile.hows.build(how_params)

    respond_to do |format|
      if @how.save
        format.html { redirect_to @how, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @how }
      else
        format.html { render :new }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  #def autocomplete
    #render json: How.search(params[:term], fields: [{title: :text_start}], limit: 10).map(&:title)
  #end

  # PATCH/PUT /hows/1
  # PATCH/PUT /hows/1.json
  def update
    
    respond_to do |format|
      if @how.update(how_params)
        format.html { redirect_to @how, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @how }
      else
        format.html { render :edit }
        format.json { render json: @how.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hows/1
  # DELETE /hows/1.json
  def destroy
    @how.destroy
    respond_to do |format|
      format.html { redirect_to hows_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  def upvote 
    @link = How.friendly.find(params[:id])

    if current_profile.voted_up_on? @link
      status = 0
      render :json => {:message => "Already Liked",:state=>status}
    else
      @link.upvote_by current_profile
      status = 1
      render :json => {:message => "Liked",:state=>status,:like_count=>@link.get_upvotes.size,:dislike_count=>@link.get_downvotes.size}
    end
    
  end  

  def downvote
    @link = How.friendly.find(params[:id])
    
    if current_profile.voted_down_on? @link
      status = 0
      render :json => {:message => "Already DisLiked",:state=>status}
    else
      @link.downvote_by current_profile
      status = 1
      render :json => {:message => "DisLiked",:state=>status,:like_count=>@link.get_upvotes.size,:dislike_count=>@link.get_downvotes.size}
    end
    
  end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_how
      @how = How.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def how_params
      params.require(:how).permit(:title, :body, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :slug, :subtitle, :subtitle1, :subtitle2, :subtitle3,
       :subtitle5, :subbody1, :subbody2, :subbody3, :subbody4, :days, :hours, :minutes, :howcover, :video, :profile_id)
    end
end
