module BotController3Helper
  require 'net/http'
  require 'json'
  require 'uri'


  def get_giph(subject)
    url = "http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=#{subject}"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    result = JSON.parse(buffer)
    giph = result['data']['image_url']
    return giph
  end


  def get_movie_theaters
    url = "http://data.tmsapi.com/v1.1/movies/showings?startDate=2017-01-16&zip=78701&api_key=mbqjmkhaegk639rmghyf9z4y"
    resp = Net::HTTP.get_response(URI.parse(url))
    buffer = resp.body
    results = JSON.parse(buffer)

    x = 0
    all = []
    while x < results.count
        movie = {}
        movie[:title] = results[x]['title']
        movie[:genres] = results[x]['genres']
        movie[:theater] = results[x]['showtimes'][0]['theatre']['name']
        movie[:time] = results[x]['showtimes'][0]['dateTime']
        movie[:tickets] = results[x]['showtimes'][0]['ticketURI']
        all << movie
      x += 1
    end

    all.each do |movie|
      # debugger
      puts movie[:title]
      # puts movie[:genres].join
    end
  end
  #there are many showtimes

end