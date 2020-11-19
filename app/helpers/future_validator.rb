
# validation for date to only be set in the future, disable to test app locally in the listing model or follow instructions in submited readme
class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, _value)
    record.errors[attribute] << (options[:message] || "can't be in the past!") if record[attribute] < Date.today
  end
end
