class ConceptsController < ApplicationController
  before_action :set_brainstorm, only: [:create]
  before_action :set_session_id, only: [:vote]
  before_action :set_concept, only: [:vote]

  def create
    @concept = Concept.new(concept_params)
    respond_to do |format|
      if @concept.save
          ConceptsChannel.broadcast_to @brainstorm, { content: @concept, concepts_total: @brainstorm.concepts.count, concept_number: @concept.number, build_on_concept_link: concept_show_concept_build_form_path(@concept), event: "create_concept" }
        format.js
      else
        @concept.errors.messages.each do |message|
          flash.now[message.first] = message[1].first
          format.js
        end
        format.js
      end
    end
  end

  def show_concept_build_form
    @concept = Concept.find(params[:concept_id])
    @brainstorm = @concept.brainstorm
    @concept_build = ConceptBuild.new
    respond_to do |format|
      format.js
    end
  end

  def vote
    @brainstorm = @concept.brainstorm
    @voting = Session::Voting.new(@brainstorm, @session_id)
    @voting.toggle_vote_for(@concept)
  end

  private

  def concept_params
    params.require(:concept).permit(:text, :brainstorm_id)
  end

  def set_brainstorm
    @brainstorm = Brainstorm.find concept_params[:brainstorm_id]
  end

  def set_concept
    @concept = Concept.find(params[:concept_id])
  end
end
