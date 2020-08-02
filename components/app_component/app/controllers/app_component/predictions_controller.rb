require_dependency "app_component/application_controller"

class AppComponent::PredictionsController < AppComponent::ApplicationController
  def new
    @teams = AppComponent::Team.all
  end

  def create
    predictor = Predictor.new(AppComponent::Team.all)
    predictor.learn(AppComponent::Game.all)
    @prediction = predictor.predict(
        AppComponent::Team.find(params['first_team']['id']),
        AppComponent::Team.find(params['second_team']['id'])
    )
  end
end