class FaqsController < ApplicationController
  def new
    @faq = Faq.new
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def index

  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save

    else
      render 'new'
    end
  end

end