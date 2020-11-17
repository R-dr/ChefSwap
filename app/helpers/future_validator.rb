class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors[attribute] << (options[:message] || "can't be in the past!") if record[attribute] < Date.today
  end
end
