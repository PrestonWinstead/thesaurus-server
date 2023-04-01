Rails.application.routes.draw do
  get 'synonyms', to: 'synonyms#index'
  get 'antonyms', to: 'antonyms#index'
end
