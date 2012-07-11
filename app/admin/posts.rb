ActiveAdmin.register Post do
  #attr_accessible :content, :title, :author

  form do |f|
    f.inputs "Details" do
      f.input :author
      f.input :title
      #f.input :slug
      #f.input :published_at
    end
    f.inputs "Content" do
      f.input :content, :input_html => {:class => 'editor'}
    end
    f.buttons
  end
end
