class FaqsController < ApplicationController
  def new
    @faq = Faq.new
    @sports = Faq.all_sports
  end

  def show
    @faq = Faq.find(params[:id])
  end

  def index
    @sports = Faq.all_sports
    @selected_sports = params[:selected] || {}
    @search_field = params[:search] || {}


    if @selected_sports.empty? && @search_field.empty? # no filter
      @faqs = Faq.all
    elsif @search_field.empty?
    #only sports buttons utilized
      @faqs = Faq.find_all_by_sport(@selected_sports.keys)
    elsif @selected_sports.empty? #only search bar utilized
      @faqs = Faq.where("question like ?", "%#{@search_field}%")
    else #both utilized
      @faqs = Faq.where("question like ? and sport in ?", 
      	                "%#{@search_field}%",
			"#{@selected_sports.keys}")

    end

  end

  def create
    @faq = Faq.new(params[:faq])
    if @faq.save
      @faqs = Faq.all
      redirect_to faqs_path
    else
      render 'new'
    end
  end

end
