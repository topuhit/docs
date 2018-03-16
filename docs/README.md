# docs
Code documents


# Javascript Demo

Code documents


```javascript
var s = "JavaScript syntax highlighting";
alert(s);
```








# Axios

```html
<!DOCTYPE html>
<html>
<head>
	<title>s</title>

	<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>
<script type="text/javascript">
	
	// axios.get('https://api.github.com/users/codeheaven-io')
 //  .then(function (response) {
 //    console.log(response);
 //  })
 //  .catch(function (error) {
 //    console.log(error);
 //  });

axios.post('https://vision.googleapis.com/v1/images:annotate?key=AIzaSyAe5OYmhsYM_ws8IZTpcc8ENIyIeRbk5S0', {
  "requests":[
    {
      "image":{
        "source":{
          "imageUri":
            "http://res.cloudinary.com/topuhit/image/upload/dpr_1.0,w_800,c_scale/e_sharpen/v1509745997/exhibition/BFA-3-09_12-20171104035256_j6wwzm.jpg"
        }
      },
      "features":[
        {
          "type":"IMAGE_PROPERTIES",
          "maxResults":1,
        },

        {
          "type":"WEB_DETECTION",
          "maxResults":10
        }
      ]
    }
  ]
})
  .then(function (response) {
    console.log(response);
    document.write(JSON.stringify(response) + "URL:" + response.request.responseURL);

  })
  .catch(function (error) {
    console.log(error);
  });

// axios.all([
//     axios.get('https://api.github.com/users/codeheaven-io'),
//     axios.get('https://api.github.com/users/topuhit'),
//     axios.get('https://api.github.com/users/topuhit/repos'),

//   ])
//   .then(axios.spread(function (userResponse, topu, reposResponse) {
//     //... but this callback will be executed only when both requests are complete.
//     console.log('User', userResponse.data);
//     console.log('Topu', topu.data);
//     console.log('Repositories', reposResponse.data);

//   }));

</script>
</body>
</html>
```