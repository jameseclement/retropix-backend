Rails.application.routes.draw do
  resources :users,  except: [:edit] do
    resources :documents do
      resources :versions, except: [:edit]
    end
  end
end
