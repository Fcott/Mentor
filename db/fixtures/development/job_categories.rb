JobCategory.seed do |s|
  s.id    = 1
  s.name  = "Software Engineer"
  s.parent_id = nil
end

JobCategory.seed do |s|
  s.id    = 2
  s.name  = "Designer"
  s.parent_id = nil
end

JobCategory.seed do |s|
  s.id    = 3
  s.name  = "Writer"
  s.parent_id = nil
end

JobCategory.seed do |s|
  s.id    = 4
  s.name  = "Others"
  s.parent_id = nil
end

# Software Engineer
JobCategory.seed do |s|
  s.id    = 5
  s.name  = "Rails"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 6
  s.name  = "Front-end"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 7
  s.name  = "iOS"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 8
  s.name  = "Android"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 9
  s.name  = "Full-stack"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 10
  s.name  = "GO"
  s.parent_id = 1
end

JobCategory.seed do |s|
  s.id    = 11
  s.name  = "PHP"
  s.parent_id = 1
end


# Designer
JobCategory.seed do |s|
  s.id    = 12
  s.name  = "Graphic Designer"
  s.parent_id = 2
end

JobCategory.seed do |s|
  s.id    = 13
  s.name  = "UI/UX Designer"
  s.parent_id = 2
end

JobCategory.seed do |s|
  s.id    = 14
  s.name  = "Interior designer"
  s.parent_id = 2
end

JobCategory.seed do |s|
  s.id    = 15
  s.name  = "Fashion designer"
  s.parent_id = 2
end


# Writer
JobCategory.seed do |s|
  s.id    = 16
  s.name  = "Copywriter"
  s.parent_id = 3
end

JobCategory.seed do |s|
  s.id    = 17
  s.name  = "Journalist"
  s.parent_id = 3
end

JobCategory.seed do |s|
  s.id    = 18
  s.name  = "Novelist"
  s.parent_id = 3
end

JobCategory.seed do |s|
  s.id    = 19
  s.name  = "Columnist"
  s.parent_id = 3
end

JobCategory.seed do |s|
  s.id    = 20
  s.name  = "Songwriter"
  s.parent_id = 3
end

JobCategory.seed do |s|
  s.id    = 21
  s.name  = "Others"
  s.parent_id = nil
end
