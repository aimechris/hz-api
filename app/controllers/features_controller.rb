class FeaturesController < ApplicationController
  before_action :set_feature

  def index
    @features = Feature.all
    json_response(@features)
  end

  def create
    @feature = Feature.create!(feature_params)
    json_response(@feature, :created)
  end

  def update
    @feature.update(feature_params)
    head :no_content
  end

  def destroy
    @feature.destroy
    head :no_content
  end

  private

  def feature_params
    params.permit(:feature_name)
  end

  def set_feature
    @feature = Feature.find(params[:id])
  end
end
