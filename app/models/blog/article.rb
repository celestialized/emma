class Blog::Article < ApplicationRecord
  WORDS_PER_MINUTE = 150
  belongs_to    :user
  has_rich_text :body
  has_many      :blog_entry_assignments,
                foreign_key: "blog_article_id", 
                class_name: "Blog::EntryAssignment"

  # has_many      :blog_entries, 
  #               through: :blog_entry_assignments,
  #               source: :entry,
  #               class_name: 'Blog::Entry'
  has_many            :blog_entries, 
                    :through => :blog_entry_assignments, 
                    :source => :blog_entry


  def self.collect_pinned
    where("pinned_value > ?", 0)
  end


end


# class Student < ApplicationRecord
#   has_many :admission_application_students, 
#             class_name: 'Admission::ApplicationStudent'
#   has_many :admission_applications, 
#                  through: :admission_application_students, 
#                   source: :application, 
#               class_name: 'Admission::Application'
# end
