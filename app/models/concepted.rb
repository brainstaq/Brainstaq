module Concepted

  def broadcast_concepts(event, concepts)
    StateChannel.broadcast_to @brainstorm, { event: event, concepts: concepts }
  end

  private

  def transmit_concepts(sorting_choice, available_votes = nil)
    ConceptsChannel.broadcast_to @brainstorm, { event: "transmit_concepts", concepts: concepts_and_concept_builds_object(sorting_choice), available_votes: available_votes }
  end

  def concepts_and_concept_builds_object(sorting_choice)
    @brainstorm.concepts.order(sorting_choice).as_json(
      methods: [:vote_in_plural_or_singular, :number],
      only: [:id, :text, :votes],
      include: {
        concept_builds: {
          methods: [:vote_in_plural_or_singular, :decimal, :opacity_lookup],
          only: [:id, :concept_build_text, :votes]
        }
      })
  end

  def sort_by_id_desc
    'id DESC'
  end

  def sort_by_votes_desc
    'votes DESC'
  end
end