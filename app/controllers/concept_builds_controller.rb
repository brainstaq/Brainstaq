class ConceptBuildsController < ApplicationController
  before_action :set_session_id, only: [:vote]
  before_action :set_concept_build, only: [:vote]

  def create
    @concept_build = ConceptBuild.new(concept_build_params)
    @concept = Concept.find(params[:concept_id])
    @brainstorm = Brainstorm.find(brainstorm_params[:brainstorm_id])
    respond_to do |format|
      if @concept_build.save
        ConceptsChannel.broadcast_to @brainstorm, { content: @concept_build, concept_build_number: "#{@concept.number}.#{@concept_build.decimal}", event: "create_concept_build", opacity: @concept_build.opacity_lookup }
        format.js
      else
        @concept_build.errors.messages.each do |message|
          flash.now[message.first] = message[1].first
          format.js
        end
      end
    end
  end

  def vote
    @concept = Concept.find(params[:concept_id])
    @brainstorm = @concept.brainstorm

    @voting = Session::Voting.new(@brainstorm, @session_id)
    @voting.toggle_vote_for(@concept_build)
  end

  private

  def concept_build_params
    params.require(:concept_build).permit(:concept_id, :concept_build_text).except(:brainstorm_id)
  end

  def brainstorm_params
    params.require(:concept_build).permit(:brainstorm_id).except(:concept_id, :concept_build_text)
  end

  def set_concept_build
    @concept_build = ConceptBuild.find(params[:concept_build_id])
  end
end
