class UrbanTermsController < ApplicationController

  before_action :authenticate_profile!, :except => [:index, :show]

  before_action :set_urban_term, only: [:show, :edit, :update, :destroy]

    impressionist actions: [:show,:index], unique: [:session_hash]

  # GET /urban_terms
  # GET /urban_terms.json
  def index
    #@urban_terms = UrbanTerm.all
    #@urban_terms = UrbanTerm.order(:title).limit(50)
    #query = params[:q].presence || "*"
    #@urban_terms = UrbanTerm.search(query)
 

  #def search
    #respond_to do |format|
     # format.html
     # format.json { @urban_terms = UrbanTerm.search(params[:term]) }
    #end
  #end

  # GET /urban_terms/1
  # GET /urban_terms/1.json



  if params[:tag]

 @urban_terms = UrbanTerm.order("created_at desc").tagged_with(params[:tag])#.paginate(:page => params[:page], :per_page => 3)

  
#elsif query = params[:q].presence || "*"
      #@hows = How.search(query)#, page: params[:page], per_page: 2)




else
  #@dhows = How.all.order("created_at desc")#.paginate(:page => params[:page], :per_page => 3)
  
@urban_terms = UrbanTerm.all
    
  end

 end








  def show
    impressionist(@urban_term)
  @urban_terms = UrbanTerm.friendly.find(params[:id])
   
    #@new_comment = Comment.new


end


  # GET /urban_terms/new
  def new
    @urban_term = UrbanTerm.new
    @tag = Tag.new

  end

  # GET /urban_terms/1/edit
  def edit
    @tag = Tag.new
  end


  # POST /urban_terms
  # POST /urban_terms.json
  def create
    #@urban_term = UrbanTerm.new(urban_term_params)
    @urban_term = current_profile.urban_terms.build(urban_term_params)

    respond_to do |format|
      if @urban_term.save
        format.html { redirect_to @urban_term, notice: 'Urban term was successfully created.' }
        format.json { render :show, status: :created, location: @urban_term }
      else
        format.html { render :new }
        format.json { render json: @urban_term.errors, status: :unprocessable_entity }
      end
    end
  end



  #def autocomplete
    #render json: UrbanTerm.search(params[:term], fields: [{title: :text_start}], limit: 10).map(&:title)
  #end


  # PATCH/PUT /urban_terms/1
  # PATCH/PUT /urban_terms/1.json
  def update
    respond_to do |format|
      if @urban_term.update(urban_term_params)
        format.html { redirect_to @urban_term, notice: 'Urban term was successfully updated.' }
        format.json { render :show, status: :ok, location: @urban_term }
      else
        format.html { render :edit }
        format.json { render json: @urban_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urban_terms/1
  # DELETE /urban_terms/1.json
  def destroy
    @urban_term.destroy
    respond_to do |format|
      format.html { redirect_to urban_terms_url, notice: 'Urban term was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote 
  @link = UrbanTerm.friendly.find(params[:id])
  @link.upvote_by current_profile
  redirect_to request.referer || root_path

  
end  

def downvote
  @link = UrbanTerm.friendly.find(params[:id])
  @link.downvote_by current_profile
  redirect_to request.referer || root_path
end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_urban_term
      @urban_term = UrbanTerm.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def urban_term_params
      params.require(:urban_term).permit(:title, :description, :tag_list, :tag, { tag_ids: [] }, :tag_ids, :slug, :inaction, :postcover, :profile_id, :urbantermcover)
    end
end
