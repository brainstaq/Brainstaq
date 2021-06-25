class Api::V1::IdeasController < ApplicationController
  IDEAS_PER_PAGE = 6

  # GET /ideas.json
  def index
    if params[:category].blank?
      @page = params.fetch(:page, 0).to_i 
      @next_page = @page + 1 if Idea.count >= 6
      @prev_page = @page - 1 if @page < 0
      @ideas = Idea.offset(@page*IDEAS_PER_PAGE).limit(IDEAS_PER_PAGE).order(created_at: :desc)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @page = params.fetch(:page, 0).to_i 
      @next_page = @page + 1 if Idea.count >= 6
      @prev_page = @page - 1 if @page < 0
      @ideas = Idea.where(category_id: @category_id).offset(@page*IDEAS_PER_PAGE).limit(IDEAS_PER_PAGE).order(created_at: :desc)
    end
    respond_to do |format|
      format.json {render :json => @ideas.to_json, :status => :ok}
    end
  end

  def show
    @idea = Idea.find(params[:id]) 
    @comment = Comment.new
    @comments = @idea.comments
    @comment.idea_id = @idea.id
    donation = Donation.includes(:idea).where(idea_id: params[:id])
    @donation = Donation.new
    donors_count = donation.count
    @donors = @idea.donations
    @donated_amount = @idea.donations.sum(:amount)
    respond_to do |format|
      format.json {render :json => @idea.to_json, :status => :ok}
    end
  end
end