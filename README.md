# Shoe Sinatra Content Management System App

## Overview


- [Project Requirements](#requirements)
- [Instructions](#instructions)
- [Practicing for Success on Learn](#success)
- [Resources](#resources)

For this assessment i created a [CRUD], [MVC] Shoes app using Sinatra. This app is a custom app that is created to track shoes. Essentially, its a Content Management System [CMS]. 
It allows the user to input and display category, size and brand of the shoes. A user is able to add, update, delete and list all shoes, shoe brand, shoe category and shoe size.
This is how all four CRUD actions were implemented: 

### Create
Now that we have the database and model set up, it's time to set up the ability to create shoes.

After a route in controller was created, get '/articles/new', that renders the new.erb view.

We need to create an ERB file in the views directory, new.erb, with a form that POSTs to a controller action, /articles. The controller action should use the Create CRUD action to create the article and save it to the database. When the form on new.erb is submitted, the action, pointing to /articles, will redirect to another action which will trigger a render of a show.erb file automatically. Before we can fully test if our form is working, we need to create that show.erb file, as our site will currently crash upon submission.

### Read
The Read CRUD action corresponds to two different controller actions: show and index. The show action should render the ERB view show.erb, which shows an individual show. The index action should render the ERB view index.erb, which shows a list of all of the shoes.

### Create
Create the get '/shoes' controller action. This action should use Active Record to grab all of the shoes and store them in an instance variable, @shoes. Then, it should render the index.erb view. That view should use ERB to iterate over @shoes and render them on the page.

### Update
The Update CRUD action corresponds to the edit controller action and view.

### Delete
The Delete CRUD action corresponds to the delete controller action, delete '/shoes/:id'. To initiate this action, we'll add a "delete" button to the show page. 

## <a id="requirements">Project Requirements</a>

1. Build an [MVC] Sinatra application.
2. Use [ActiveRecord] with Sinatra.
3. Use multiple models.
4. Use at least one `has_many` relationship on a User model and one `belongs_to` relationship on another model.
5. Must have user accounts - users must be able to sign up, sign in, and sign out.
6. Validate uniqueness of user login attribute (username or email).
7. Once logged in, a user must have the ability to create, read, update and destroy the resource that `belongs_to` user.
8. Ensure that users can edit and delete only their own resources - not resources created by other users.
9. Validate user input so bad data cannot be persisted to the database.


## <a id="resources">Resources</a>

[CRUD]: https://learn.co/tracks/full-stack-web-development-v6/orms-and-activerecord/activerecord/activerecord-crud-lab
[CMS]: http://www.businessdictionary.com/definition/content-management-system-CMS.html
[technical interviews]: https://www.brightnetwork.co.uk/career-path-guides/technology-it-software-development/five-ways-stand-out-your-technology/what-expect-technical-interview/
[MVC]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/mvc-and-forms/intro-to-mvc
[section lead]: http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads
[Golf Club Organizer]: https://github.com/learn-co-curriculum/example-sinatra-assessment
[Todo List]: http://todomvc.com
[Fill out this checklist.]: https://docs.google.com/forms/d/e/1FAIpQLSdIrS7g6y_B4dAY7HGS4yAndg9bfHuw7GmsiwA6MQXXqNrDjA/viewform?entry.237262577&entry.835010005&entry.301147721
[ActiveRecord]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/activerecord-setup-in-sinatra
[slack]: https://learn-co.slack.com
[section lead]: http://help.learn.co/instructional-support/receiving-course-support/who-are-the-section-leads
[messages]: https://github.com/SFEley/sinatra-flash
[spec.md]: https://github.com/learn-co-students/sinatra-cms-app-assessment-v-000/blob/master/spec.md
[license]: https://opensource.org/licenses/MIT
[study groups]: https://learn.co/study-groups
[project support sessions]: https://theflatironschool.typeform.com/to/B9BrgH
[Example Domain - Golf Club Organizer]: https://github.com/learn-co-curriculum/example-sinatra-assessment
[RESTful Routing]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/sinatra-restful-routes
[Securing Passwords in Sinatra]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/securing-passwords-in-sinatra
[Mechanics of Sessions]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/sessions/mechanics-of-sessions
[Video: Sinatra app from scratch]: https://learn.co/tracks/full-stack-web-development-v6/sinatra/activerecord/video-review-authentication
