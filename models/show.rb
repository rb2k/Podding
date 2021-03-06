# encoding: utf-8

class Show < Mlk::Model

  attribute :title
  attribute :cover_url
  attribute :author, -> { Settings.author }
  attribute :description, -> { Settings.description }

  has_many :Episode, :episodes

  def audioformats
    data['audioformats'].map do |format|
      Audioformat.first(:name => format)
    end
  end

  def live_episodes
    Episode.find(show: data['name'], status: 'live')
  end

  def published_episodes
    Episode.find(show: data['name'], status: 'published')
  end

  def planned_episodes
    Episode.find(show: data['name'], status: 'planned')
  end

end

