class ReleaseYearPresenceValidator < ActiveModel::Validator
  def validate(record)
    if record.released && record.release_year.nil?
       record.errors[:release_year] << "cannot be blank if song is released"
    end
  end
end
