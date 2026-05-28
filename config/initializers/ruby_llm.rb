RubyLLM.configure do |config|
  # LE FIX EST ICI : just 'gpt-4o' sans le 'openai/' devant !
  config.default_model = 'gpt-4o'

  config.openai_api_key = ENV['GITHUB_TOKEN']
  config.openai_api_base = "https://models.inference.ai.azure.com"

  config.openrouter_api_key = ENV['OPENROUTER_API_KEY']
end
