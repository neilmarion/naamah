require 'pry'
require 'vcr'
require 'json'

require_relative '../lib/naamah/api'

#VCR config
VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/cassettes'
  c.hook_into :webmock
end

def record_api_call_for(method_name)
  VCR.use_cassette method_name do
    @api_response = Naamah::Api.send(method_name)
  end

  @json_data = JSON.parse(@api_response).first
end
