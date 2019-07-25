class ShortenedUrl < ApplicationRecord
    validates :long_url, :short_url, presence: true
    validates :short_url, uniqueness: true 
    
    def self.random_code
    url = SecureRandom::urlsafe_base64(16)
        while ShortenedUrl.exists?(short_url: url)
            url = SecureRandom::urlsafe_base64(16)
        end 
        return url 
    end 

    def self.create_short_url(user, long_url)
        ShortenedUrl.create!(
            submitter_id: user.id,
            long_url: long_url,
            short_url: ShortenedUrl.random_code
        )
    end 

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User

end 