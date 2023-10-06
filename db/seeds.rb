# db/seeds.rb

# Create Users
user1 = User.create(email: "user1@example.com", password: "password123", first_name: "John", last_name: "Doe", address: "123 Street")
user2 = User.create(email: "user2@example.com", password: "password123", first_name: "Jane", last_name: "Doe", address: "124 Street")

# Create Projects
project1 = Project.create(name: "Project1", description: "This is project 1")
project2 = Project.create(name: "Project2", description: "This is project 2")

# Create Tasks
task1 = Task.create(subject: "Task1", description: "This is task 1 for project 1", status: 0, user_id: user1.id, project_id: project1.id)
task2 = Task.create(subject: "Task2", description: "This is task 2 for project 1", status: 1, user_id: user1.id, project_id: project1.id)
task3 = Task.create(subject: "Task3", description: "This is task 1 for project 2", status: 2, user_id: user2.id, project_id: project2.id)

# Create Attachments
attachment1 = Attachment.create(description: "Attachment for task 1", task_id: task1.id)
attachment2 = Attachment.create(description: "Attachment for task 2", task_id: task2.id)
