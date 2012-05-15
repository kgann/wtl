class FaqsController < ApplicationController
  def index
    @faqs = Faq.order("created_at ASC")
  end
end
