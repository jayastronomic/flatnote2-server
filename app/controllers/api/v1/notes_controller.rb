module Api
  module V1
    class NotesController < ApplicationController
      def create
        note = Note.new(note_params)
        if note.save
          render json: { status: "SUCCESS", message: "Note created", note: note }
        else
          render json: { status: "INVALID", message: "Note not created", errors: note.errors.full_messages }
        end
      end

      private

      def note_params
        params.require(:note).permit(
          :title,
          :description
        )
      end
    end
  end
end
