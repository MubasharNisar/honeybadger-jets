require 'honeybadger'

module HoneybadgerJets
  class Turbine < ::Jets::Turbine
    initializer 'honeybadger.configure' do
      Honeybadger.configure do |config|
        config.api_key = ENV["HONEYBADGER_API_KEY"]
        config.logger = ::Logger.new(STDOUT)
        config.report_data= true
        config.env = Jets.env.to_s
        config.debug= true
      end
    end

    on_exception 'honeybadger.capture' do |exception|
      Honeybadger.notify(exception)
    end
  end
end