class ReleaseYearValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    max_year = Time.now.year
      unless !!value && value.to_i <= max_year

         record.errors[attribute] << (options[:message] || "not a valid year." )

      end
    end
  end
