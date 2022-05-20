# http_simulator
http_simulator library act as backend server, it for development purpose.

## Features
- send http GET request
- send http POST request
- act as backend API.
- it have own local storage act like DB.



## Installation

with Dart

```sh
dart pub add http_simulator
```


with Flutter

```sh
flutter pub add http_simulator
```
This will add a line like this to your package's pubspec.yaml (and run an implicit dart pub get):
```sh
dependencies:
  http_simulator: ^1.0.1
```

## DESCRIPTION
in below we will describe the endpoin and the request and response for each enpoint :

#### User API's:
- Register API : /user/register
```sh
// request body Example: 
{
   "id":1,
   "idNumber":"101254654",
   "fullName":"Khalid Alshehri",
   "dateOfBirth":"2022-10-10",
   "email":"demo@email.com",
   "mobile":"96650052154"
   }
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/user/register"),
      body: requestBody);
      
     // the lib will return HttpStatus = 201 , without response body
```

- Login API : /user/login
```sh
// request body Example : 
{
   "idNumber":"tom",
   "password":"pass@123"
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/user/login"),
      body: requestBody);
      
     // the lib will return HttpStatus = 200 
     // response body Example :
     {
   "id":1,
   "idNumber":"101254654",
   "fullName":"Khalid Alshehri",
   "dateOfBirth":"2022-10-10",
   "email":"demo@email.com",
   "mobile":"96650052154",
   "tasks":[
      {
         "id":1,
         "name":"TASK1",
         "points":1500,
         "description":"TASK 1",
         "type":"TASK 1"
      }
   ],
   "badge":[
      {
         "id":1,
         "name":"BADGE1",
         "points":1500,
         "description":"BADGE1 1",
         "type":"BADGE1 1"
      }
   ]
}
```


- Add task to user API : /user/task?taskId=#{taskId}
```sh
// request body Example : 
{
    "id":4, // userId
   "idNumber":"1051554145",
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/user/task?taskId=#{taskId}"),
      body: requestBody);
      
     // the lib will return HttpStatus = 200 
     // response body Example :
     {
   "id":1,
   "idNumber":"101254654",
   "fullName":"Khalid Alshehri",
   "dateOfBirth":"2022-10-10",
   "email":"demo@email.com",
   "mobile":"96650052154",
   "tasks":[
      {
         "id":1,
         "name":"TASK1",
         "points":1500,
         "description":"TASK 1",
         "type":"TASK 1"
      }
   ],
   "badge":[
      {
         "id":1,
         "name":"BADGE1",
         "points":1500,
         "description":"BADGE1 1",
         "type":"BADGE1 1"
      }
   ]
}
```


- Add Badge to user API : /user/badge?badgeId=#{badgeId}
```sh
// request body Example : 
{
    "id":4, // userId
   "idNumber":"1051554145",
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/user/badge?badgeId=#{badgeId}"),
      body: requestBody);
      
     // the lib will return HttpStatus = 200 
     // response body Example :
     {
   "id":1,
   "idNumber":"101254654",
   "fullName":"Khalid Alshehri",
   "dateOfBirth":"2022-10-10",
   "email":"demo@email.com",
   "mobile":"96650052154",
   "tasks":[
      {
         "id":1,
         "name":"TASK1",
         "points":1500,
         "description":"TASK 1",
         "type":"TASK 1"
      }
   ],
   "badge":[
      {
         "id":1,
         "name":"BADGE1",
         "points":1500,
         "description":"BADGE1 1",
         "type":"BADGE1 1"
      }
   ]
}
```
#### Complaint API's:
- Add complaint API : /complaints
```sh
// request body Example: 
{
   "category":"test",
   "title":"test",
   "details":"test",
   "userId":5,
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/complaints"),
      body: requestBody);
      
     // the lib will return HttpStatus = 201 , without response body
```

- Get list Of User Complaints API : /complaints?userId=#{userId}
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/complaints?userId=#{userId}");
           
    // the lib will return HttpStatus = 200 
    // response body Example :
[
   {
      "id":1,
      "category":"test",
      "title":"test",
      "details":"test",
      "status":"test",
      "userId":5,
      "createdAt":"test",
      "lastUpdatedAt":"test"
   },
   {
      "id":1,
      "category":"test",
      "title":"test",
      "details":"test",
      "status":"test",
      "userId":5,
      "createdAt":"test",
      "lastUpdatedAt":"test"
   }
]
```

- Get Complaint by id API : /complaints/#{complaintId}
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/complaints/#{complaintId}");
           
    // the lib will return HttpStatus = 200 
    // response body Example :
[
   {
      "id":1,
      "category":"test",
      "title":"test",
      "details":"test",
      "status":"test",
      "userId":5,
      "createdAt":"test",
      "lastUpdatedAt":"test"
   }
```

#### Task API's:
- Add Task API : /tasks
```sh
// request body Example: 
{
   "name":"TASK1",
   "points":1500,
   "description":"TASK 1",
   "type":"TASK 1"
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/tasks"),
      body: requestBody);
      
     // the lib will return HttpStatus = 201 , without response body
```

- Get list Of Task API : /tasks
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/tasks");
           
    // the lib will return HttpStatus = 200 
    // response body Example :
[
   {
   "id":1,
   "name":"TASK1",
   "points":1500,
   "description":"TASK 1",
   "type":"TASK 1"
},
   {
   "id":1,
   "name":"TASK1",
   "points":1500,
   "description":"TASK 1",
   "type":"TASK 1"
}
]
```

- Get Task by id API : /tasks/#{tasktId}
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/tasks/#{tasktId}");
           
    // the lib will return HttpStatus = 200 
    // response body Example :

  {
   "id":1,
   "name":"TASK1",
   "points":1500,
   "description":"TASK 1",
   "type":"TASK 1"
}
```

#### Badges API's:
- Add badge API : /badges
```sh
// request body Example: 
{
   "name":"BADGE1",
   "points":1500,
   "description":"BADGE1 1",
   "type":"BADGE1 1"
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/badges"),
      body: requestBody);
      
     // the lib will return HttpStatus = 201 , without response body
```

- Get list Of badges API : /badges
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/badges");
           
    // the lib will return HttpStatus = 200 
    // response body Example :
[
   {
   "id":1,
   "name":"BADGE1",
   "points":1500,
   "description":"BADGE1 1",
   "type":"BADGE1 1"
},
   {
   "id":1,
   "name":"BADGE1",
   "points":1500,
   "description":"BADGE1 1",
   "type":"BADGE1 1"
}
]
```

- Get Task by id API : /badges/#{badgeId}
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/badges/#{badgeId}"),
      body: requestBody);
           
    // the lib will return HttpStatus = 200 
    // response body Example :

  {
   "id":1,
   "name":"BADGE1",
   "points":1500,
   "description":"BADGE1 1",
   "type":"BADGE1 1"
}
```

#### Offer API's:
- Add Offer API : /offers
```sh
// request body Example: 
{
   "category":"offer",
   "title":"offer",
   "description":"offer",
   "code":"OFFER"
}
   
  HttpRoutingSimulator.post(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/offers"),
      body: requestBody);
      
     // the lib will return HttpStatus = 201 , without response body
```

- Get list Of offers API : /offers/#{category}
```sh
  HttpRoutingSimulator.get(
      Uri.parse(HttpRoutingSimulator.BASE_URL + "/offers/#{category}");
           
    // the lib will return HttpStatus = 200 
    // response body Example :
[
   {
   "id":1,
   "category":"offer",
   "title":"offer",
   "description":"offer",
   "code":"OFFER"
},
   {
   "id":1,
   "category":"offer",
   "title":"offer",
   "description":"offer",
   "code":"OFFER"
}
]
```
## License

MIT

