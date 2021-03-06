# frozen_string_literal: true

class Category::BreakdownsController < ApplicationController
  before_action :authenticate
  before_action :set_category

  def index
    @user = current_user.decorate
    @breakdowns = @category.breakdowns.order(:id)
  end

  def create
    @category.breakdowns.new(new_breakdown_params)
    if @category.save
      head 201
    else
      render_error @category
    end
  end

  def update
    @breakdown = @category.breakdowns.find(params[:id])
    if @breakdown.update(name: params[:name])
      head 200
    else
      render_error @breakdown
    end
  end

  def destroy
    @breakdown = @category.breakdowns.find(params[:id])
    @breakdown.destroy
    head @breakdown.destroyed? ? :ok : :forbidden
  end

  private

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def new_breakdown_params
    params.permit(:category_id, :name)
  end
end
