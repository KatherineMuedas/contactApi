class Contact < ActiveRecord::Base
  scope :search_relationship, -> (relationship) { where relationship: relationship }
  scope :search_twitter, -> (twitter) { where twitter: twitter }
  scope :fuzzy_twitter, -> (twitter) { where('twitter ilike ?', "%#{twitter}%") }
  scope :search_name, -> (name) { where name: name }

end
