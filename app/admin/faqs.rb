ActiveAdmin.register Faq do
  menu :priority => 20
  form do |f|
    f.inputs "Frequently Asked Question" do
      f.input :question
      f.input :answer,  :hint => "To Create Links, use ths format: (link text)[www.google.com]<br />It will become: #{link_to("link text", "http://www.google.com")}".html_safe
    end
  end
end
