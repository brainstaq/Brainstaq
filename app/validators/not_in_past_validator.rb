class NotInPastValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.blank?
      record.errors.add attribute, (options[:message] || "can't be blank")
    elsif value <= Time.zone.today
      # record.errors.add attribute, (options[:message] || "can't be in the past")
      record.errors[attribute] << (options[:message] || "can't be in the past")
    elsif value >= (Time.now.to_date + 40.days)
      # record.errors.add attribute, (options[:message] || "can't be in the past")
      record.errors[attribute] << (options[:message] || "must not be more than 40 days")
    end
  end
end