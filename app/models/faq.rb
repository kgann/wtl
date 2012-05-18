class Faq < ActiveRecord::Base
  attr_accessible :question, :answer

  validates_presence_of :question, :answer
end
