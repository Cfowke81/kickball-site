require "sinatra"
require_relative "models/player"
require_relative "models/team"
require_relative "models/team_data.rb"
require 'pry'

set :bind, '0.0.0.0'  # bind to all interfaces



get "/" do
  erb :index
end

get "/teams" do
  @teams = TeamData::ROLL_CALL.keys
  erb :teams
end

get "/teams/:team_name" do
  @team_name = params[:team_name]
  @team_roster = TeamData::ROLL_CALL[@team_name.to_sym]
  erb :individual_team
end
