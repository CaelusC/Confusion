class NoteLink < ApplicationRecord
  belongs_to :source_note
  belongs_to :target_note
end
