class Track < ApplicationRecord
    validates :title, :ord, :album_id, :regular, presence: true 

    belongs_to :album,
        primary_key: :id,
        foreign_key: :album_id,
        class_name: :Album

    has_many :notes,
        primary_key: :id,   
        foreign_key: :track_id,
        class_name: :Note
end 