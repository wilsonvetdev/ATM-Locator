class Quotes

    def self.grab_chucknorris_joke
        response = RestClient.get("https://api.chucknorris.io/jokes/random")
        body = response.body
        parsed = JSON.parse(body)
        puts parsed["value"]
    end

end