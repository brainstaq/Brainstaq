class ConceptBuild < ApplicationRecord
  belongs_to :concept

  validates :concept_build_text, presence: {message: "You forgot to write something!"}

  def opacity_lookup
    opacity_hash[decimal] || 10
  end

  def opacity_hash
    {1=>90, 2=>80, 3=>70, 4=>60, 5=>50, 6=>40, 7=>30, 8=>20, 9=>10}
  end

  def decimal
    concept.concept_builds.order(:id).index(self) + 1
  end

  def vote_in_plural_or_singular
    votes > 1 || votes == 0 ? "votes" : "vote"
  end
end