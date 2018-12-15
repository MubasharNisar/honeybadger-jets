require 'honeybadger'

module HoneybadgerJets
  class Turbine < ::Jets::Turbine
    initializer 'honeybadger.configure' do
      Honeybadger.configure do |config|
        config.api_key = ENV["HONEYBADGER_API_KEY"]
      end
    end

    on_exception 'honeybadger.capture' do |exception|
      Honeybadger.notify(exception)
    end
  end
end