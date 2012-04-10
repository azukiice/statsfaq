class FaqsController < ApplicationController
  def new
    @faq = Faq.new
    @sports = Faq.all_sports
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def index
    @faqs = Faq.all
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
