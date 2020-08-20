class Advice

    def self.grab_advice
        response = RestClient.get("https://api.adviceslip.com/advice")
        body = response.body
        parsed = JSON.parse(body)
        puts "-----------------------------------------"
        puts "Random Advice Slip:".blue
        puts parsed["slip"]["advice"].blue
        puts "-----------------------------------------"
    end

end