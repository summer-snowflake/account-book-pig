# frozen_string_literal: true
class Record::Fetcher
  include ActiveModel::Model
  attr_accessor :total_count

  def initialize(user: nil, params: nil, sort_type: nil)
    @user = user
    @sort_type = sort_type
    @year = params[:year].to_i
    @month = params[:month].to_i
    @day = params[:day].to_i
    @category_id = params[:category_id]
    @breakdown_id = params[:breakdown_id]
    @place_id = params[:place_id]
    @offset = params[:offset]
  end

  def all
    records = @user.records.order(published_at: :desc, created_at: :desc)
    records = find_by_date(records)
    records = records.where(category_id: @category_id) if @category_id
    records = records.where(breakdown_id: @breakdown_id) if @breakdown_id
    records = records.where(place_id: @place_id) if @place_id
    @total_count = records.count
    records = records.offset(@offset) if @offset.present?
    records.limit(Settings.records.per)
  end

  def mypage
    records = @user.records.order(created_at: :desc)
    records.limit(5)
  end

  def all_as_csv
    records = @user.records.order(:published_at)
    records = find_by_date(records)
    records = records.where(category_id: @category_id) if @category_id
    records = records.where(breakdown_id: @breakdown_id) if @breakdown_id
    records.where(place_id: @place_id) if @place_id
  end

  private

  def find_by_date(records)
    if @day.nonzero?
      records.the_day(Date.new(@year, @month, @day))
    elsif @month.nonzero?
      records.the_month(Date.new(@year, @month, 1))
    elsif @year.nonzero?
      records.the_year(Date.new(@year, 1, 1))
    else
      records.the_day(Time.zone.now.to_date)
    end
  end
end
