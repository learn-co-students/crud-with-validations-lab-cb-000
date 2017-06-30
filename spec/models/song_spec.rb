require 'rails_helper'



describe Song do
  let(:attributes)do
  {
    title: "My Way",
    artist_name: "Usher",
    released: true,
    release_year: 1996

  }
end

it "is considered valid"do
  expect(Song.new(attributes)).to be_valid
end
end
