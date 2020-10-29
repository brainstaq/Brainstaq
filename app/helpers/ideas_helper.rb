module IdeasHelper
  def purchased_perk(perk)
    user_signed_in? && current_user.donations.include?("#{perk.title.parameterize}-perk_#{perk.id}")
  end
end
