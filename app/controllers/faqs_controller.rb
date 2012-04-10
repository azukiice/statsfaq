class FaqsController < ApplicationController
  def new
    @faq = Faq.new
    @sports = Faq.all_sports
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def index
    @selected_sports = params[:selected] || {}
    unless @selected_sports.empty?
      @faqs = Faq.find_all_by_sport(@selected_sports.keys)
    else
      @faqs = Faq.all
    end
    @sports = Faq.all_sports
  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      @faqs = Faq.all
      render 'index'
    else
      render 'new'
    end
  end

end
