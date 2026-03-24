class Note < ApplicationRecord
  belongs_to :folder
  belongs_to :project
  has_many :outgoing_links, class_name: "NoteLink", foreign_key: :source_note_id, dependent: :destroy
  has_many :incoming_links, class_name: "NoteLink", foreign_key: :target_note_id, dependent: :destroy
  has_many :linked_notes, through: :outgoing_links, source: :target_note
  has_many :linking_notes, through: :incoming_links, source: :source_note
end
