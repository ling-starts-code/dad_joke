class Slack
    def send_slack_notification message
      begin
        uri = URI.parse(Rails.application.secrets[:slack_webhook])
  
        env = (ENV["HOST"] || Rails.env.humanize)
  
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.request_uri)
  
        payload = {
          channel: Rails.configuration.app[:slack_channel],
          username: "webhookbot",
          text: "#{env} - #{message}"
        }
  
        request.body = payload.to_json
  
        response = http.request(request)
        raise "Slack Notifcation - An error has occurred. #{response.body}" if response.code.to_i != 200
      rescue Exception => e
        Raven.capture_exception(e)
      end
    end
  end