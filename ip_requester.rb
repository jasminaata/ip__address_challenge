require "typhoeus"

services = [
  "http://checkip.amazonaws.com/", 
  "http://checkip.dyndns.org/", 
  "http://ifconfig.me/ip",
  "http://corz.org/ip"
]

responses = []
hydra = Typhoeus::Hydra.hydra

services.each do |service|
  req = Typhoeus::Request.new(service)
  req.on_complete do |res|
      if res.response_code == 200
        if responses.include? res.response_body 
          puts responses
          next
        else
          responses.push(res.response_body) 
        end
      end  
  end

  hydra.queue req
end

hydra.run



