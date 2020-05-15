class Project <ApplicationRecord
  validates_presence_of :name, :material
  belongs_to :challenge
  has_many :contestant_projects
  has_many :contestants, through: :contestant_projects

  def contestant_count
     self.contestant_ids.count
  end

  def average_experience
    '%.2f' % self.contestants.average(:years_of_experience).to_f
  end
end
