class KeywordsController < ApplicationController

  def index

    if params[:last_hour]
      @keywords = Keyword.where(created_at: 1.hour.ago..Time.now).order(:created_at).page params[:page]
    elsif params[:last_day]
      @keywords = Keyword.where(created_at: 1.day.ago..Time.now).order(:created_at).page params[:page]
    elsif params[:last_week]
      @keywords = Keyword.where(created_at: 1.week.ago..Time.now).order(:created_at).page params[:page]
    elsif params[:last_month]
      @keywords = Keyword.where(created_at: 1.month.ago..Time.now).order(:created_at).page params[:page]
    else
      @keywords = Keyword.order(:created_at).page params[:page]
    end

  end

  def show

    @keyword = Keyword.find(params[:id])

    respond_to do |format|
      format.js
    end

  end

  def destroy

    @keyword = Keyword.find(params[:id])
    @keyword.delete

    respond_to do |format|
      format.js
    end

  end

  private


end
