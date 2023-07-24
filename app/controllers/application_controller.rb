class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  # Fetch all notes
  get "/notes" do
    notes = Note.all
    notes.to_json
  end

  # get one note
  get "/notes/:id" do
    note = Note.find(params[:id])
    note.to_json
  end

  # create note
  post "/create" do
    note = Note.create(title: params[:title], description: params[:description])
    note.to_json
    { message: "Note created successfully" }.to_json
  end

  # edit one note
  patch "/edit/:id" do
    note = Note.find(params[:id])
    note.update(title: params[:title], description: params[:description])
    { message: "Note updated successfully" }.to_json
  end

  # delete one note
  delete "/delete/:id" do
    note = Note.find(params[:id])
    note.destroy
    { message: "Note deleted" }.to_json
  end

  # delete all notes
  delete "/delete_all" do
    Note.destroy_all
    { message: "All Notes deleted" }.to_json
  end
end
