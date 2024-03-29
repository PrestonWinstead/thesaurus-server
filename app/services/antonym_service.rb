require 'openai'

class AntonymService
  attr_reader :term

  def initialize(term)
    @term = term
  end

  def find_antonyms
    response = openai_client.completions(prompt: synonym_string, max_tokens: 256)
    response.choices.pluck('text')
  end

  private

  def synonym_string
    "Give me several antonyms for the word '#{term}' in a numbered list."
  end

  def openai_client
    OpenAI::Client.new(api_key: ENV.fetch('OPENAI_API_KEY'), default_engine: 'text-davinci-003')
  end
end
