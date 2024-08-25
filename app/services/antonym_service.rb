require 'openai'

class AntonymService
  attr_reader :term

  def initialize(term)
    @term = term
  end

  def find_antonyms
    response = openai_client.chat(
      parameters: {
          model: "gpt-4o",
          messages: [{ role: 'user', content: antonym_string}],
      })
    response['choices'].first['message']['content']
  end

  private

  def antonym_string
    "Give me several antonyms for the word '#{term}' in a numbered list. Do not include anything except the list of synonyms in your response message."
  end

  def openai_client
    OpenAI::Client.new(
      access_token: ENV.fetch('OPENAI_API_KEY'),
      log_errors: true
    )
  end
end
