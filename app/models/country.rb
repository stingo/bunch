class Country < ApplicationRecord
	has_many :thing_countries

	has_many :companies, through: :thing_countries

	belongs_to :profile


	     extend FriendlyId
         friendly_id :country, use: :slugged

 

  def should_generate_new_friendly_id?
    country_changed?
  end

  def country_name
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name || country.country
  end

  def country_country
    country = ISO3166::Country[country_code]
    country.translations[I18n.locale.to_s] || country.name || country.country
  end


end
