# README

# Blog Application API

This application is containerized, so all you need to do to run it is type the command 'docker-compose up' from the project directory.

* To signup:
    path: (http://localhost:3001/signup)
    request type: POST
    request body: { "user": {
      "email": "test@gmail.com",
      "password": "123450",
      "name": "user1",
      "image": "copy base64 image"}
    }
    
* To login:
    path: (http://localhost3001/login)
    request type: POST
    request body: { "user": {
      "email": "test@gmail.com",
      "password": "123450"}
     }
     
* To create a new post/blog:
    path: (http://localhost3001/create_blog)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { "blog": {
      "title": "new post",
      "body": "test post body"},
    "tag": {"title": "tag"}
    }

* To update a post/blog:
    path: (http://localhost3001/edit_blog)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "id": 1,
      "blog" : {
        "title": "new title"}
    }
    
* To delete a post/blog:
    path: (http://localhost3001/delete_blog)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
    "id": 1}
    
* To create a comment:
    path: (http://localhost3001/create_comment)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "body": "first comment",
      "blog_id": 1
    }
    
* To edit a comment:
    path: (http://localhost3001/edit_comment)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "id": 1,
      "blog_id": 1,
      "comment" : {
        "body": "edited comment"}
    }
    
* To delete a comment:
    path: (http://localhost3001/delete_comment)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "id": 1}
      
* To create a tag:
    path: (http://localhost3001/create_tag)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "title": "Tag2",
      "blog_id": 1
    }

* To delete a tag:
    path: (http://localhost3001/delete_tag)
    request type: POST
    header: key: token, value: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2RhdGEiOjJ9.dD9ByiWti4zzumkJPqPRBl9yngwk12I2XpudjG-bb58 (returned after signup or login)
    request body: { 
      "id": 5
     }
