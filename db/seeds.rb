# Clear existing data
Attachment.delete_all
Task.delete_all
User.delete_all
Project.delete_all

# Create 20 users
20.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    password: "password#{i + 1}",
    first_name: "First#{i + 1}",
    last_name: "Last#{i + 1}",
    address: "Address#{i + 1}"
  )
end

# Create 20 projects
20.times do |i|
  Project.create!(
    name: "Project#{i + 1}",
    description: "Description for project #{i + 1}"
  )
end

# Create 20 tasks with random user and project associations
20.times do |i|
  Task.create!(
    subject: "Task#{i + 1}",
    description: "Description for task #{i + 1}",
    status: rand(0..3),
    user_id: User.all.sample.id,
    project_id: Project.all.sample.id
  )
end

# Create 20 attachments with random task associations
20.times do |i|
  Attachment.create!(
    description: "Attachment Description#{i + 1}",
    task_id: Task.all.sample.id,
    upload: "file_upload#{i + 1}.txt"
  )
end
