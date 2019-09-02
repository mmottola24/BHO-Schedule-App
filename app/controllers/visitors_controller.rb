class VisitorsController < ApplicationController

  def index
    @schedule = Schedule.get_team_schedule(@team.name)
  end

  def full_team_schedule
    permalink = params[:permalink] || @team.permalink
    get_team_schedule(permalink)
  end

  def calendar
    @data = {}
    @data[:team_name] = params[:permalink] || @team.permalink
  end

  def standings
    @season = @team.active_season

    if @season.standings.blank? or (@season.standings_cachetime <  (Time.now - 1.hours))
      # Cache does not exist or out of date, build it

      page = Nokogiri::HTML(open(@season.url))
      @standings = page.css('div#ctl00_C_pnlStandings > table')

      @data = { 'headers' => [], 'body' => [] }

      @standings.search('tr').each_with_index do |tr, index|

        if index == 1
          headers_data = []
          cells = tr.search('th')
          cells.each do |cell|
            text = cell.text.strip.gsub(/\W/, '')
            text = 'Team' if text == ''
            headers_data.push(text)
          end
          @data['headers'] = headers_data

        elsif index > 2
          cells = tr.search('td')
          row = {}
          cells.each_with_index do |cell, i|
            text = cell.text.strip
            row[@data['headers'][i].to_s] = text
          end
          @data['body'].push(row)
        end
      end

      json = @data.to_json
      @season.standings = json
      @season.standings_cachetime = Time.now
      @season.save
    else
      # load from cache
      @data = JSON.parse @season.standings
    end
  end

  private

  def get_team_schedule team_name
    @data               = {}
    @data[:team_name]   = team_name
    @data[:schedule]    = Schedule.get_team_schedule(team_name)

    respond_to do |format|
      format.html { render 'visitors/team_schedule' }
      format.json {
        render json: Schedule.get_events_calendar_object(@data[:schedule], team_name)
      }
    end
  end

end
