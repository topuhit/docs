# Template
Some Useful templates.

## Rest api Template that works: 

REST Template

[Tutorial](https://getstream.io/blog/building-rest-api-node-js-restify-mongodb/)
[Github](https://github.com/GetStream/node-restify-mongo-api)

```json
   {
        "task": "Eat Jelly Beans",
        "status": "in progress"
    }
```

## Babel Template

Babel Template

```html
<!DOCTYPE html>
<html>
<head>
  <title></title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/3.2.5/jquery.fancybox.min.js"></script>

<style>

</style>
</head>
<body>

<div id="output"></div>
<!-- Load Babel -->
<script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
<!-- Your custom script here -->
<script type="text/babel">
const getMessage = () => "Hello World";

var text = ''

var hello = ["v1513956458/Void_2000_gbd7pq.png","v1513956458/Void_2000_gbd7pq.png","v1513956456/Void3_2000_vzkmek.png","v1513956457/Void2_2000_exbxib.png","v1513956455/Void4_2000_vnmu72.png"]

var hello2 = ["v1514596081/Cover_jz2fwc.png","v1514596122/FB-Profilepicture-2-Post-Processing_xxstml.png","v1514596103/FB-Profilepicture_rhilyk.png","v1514596134/35Chai_vic0ka.jpg","v1514596139/35Chai_Banner_rrl4n4.jpg","v1514596129/Poster_wkosux.jpg","v1515584837/FB-6_c30is9.png","v1515584868/FB-7_gxmd0u.png"]

 var uodaadda =  ["v1514072358/UodaAdda_5x7-ration_o_wydncm.png","v1514072358/UodaAdda_5x7-ration_o_wydncm.png","v1513956463/Portfolio5_o_kqgxdy.png","v1513956462/uoda_2_o_jmghz4.jpg","v1513956461/Uoda_o_buunqx.jpg","v1513956460/UODA-Adda_3_vpvdus.jpg"]
var unlock =  ["v1514072354/unlock-01_fetimo.png","v1514072380/unlock-02_nhvlec.png","v1514072379/unlock-03_obpkzs.png","v1514072379/unlock-04_ywcdwc.png","v1514072378/unlock-05_k08fgm.png","v1514072377/unlock-06_ljv48g.png","v1514072376/unlock-07_hy0qel.png","v1514072376/unlock-08_zzm6sc.png","v1514072375/unlock-09_n6gdu7.png","v1514072374/unlock-10_n4n1wc.png","v1514072356/unlock-11-01_o_updssn.png","v1514072021/unlock-12_de2a0x.png","v1514072357/unlock-13_o_fqjkr3.png"]
var mukti =  ["v1513955094/Muktijuddo-Banner_gv4omz.jpg","v1513955094/Muktijuddo-Banner_gv4omz.jpg","v1513956418/IMG_0853_sb6rl8.jpg","v1513956418/IMG_0853_sb6rl8.jpg","v1513956417/IMG_0854_avl40y.jpg","v1513956416/IMG_0855_ns34zc.jpg","v1513956415/IMG_0856_bgsz29.jpg","v1513956415/IMG_0856_bgsz29.jpg","v1513956414/IMG_0857_fkcgyu.jpg","v1513956414/IMG_0858_c9bwzl.jpg","v1513956414/IMG_0858_c9bwzl.jpg","v1513956413/IMG_0859_t9bc9f.jpg","v1513956412/IMG_0860_jqh8c9.jpg","v1513956411/IMG_0861_o55ag9.jpg","v1513956411/IMG_0862_agsbgk.jpg","v1513956410/IMG_0863_ewljw3.jpg","v1513955323/IMG_0865_yjur9k.jpg","v1513955117/IMG_0851_nfne1h.jpg","v1513955110/IMG_0","_gciayd.jpg"]

var shemahin =  ["v1514072410/Shemahin-Banner-2_5x7_Rati_ssf4cc.png","v1514072512/Shemahin_Online_Book_Shop_2_lizj8s.jpg","v1514072512/Shemahin_Online_Book_Shop_2_lizj8s.jpg","v1514072411/Shemahin_Online_Book_Shop_1391_tg2yu2.jpg","v1514072412/Shemahin_Online_Book_Shop_5x7_ryeqjy.png","v1514072413/Shemahin_Online_Book_Shop_3_q3r4iq.jpg","v1514072410/Shemahin-404_r068si.png","v1514072410/Shemahin-404_r068si.png","v1514072409/Shemahin-Discount-coupon_3_fo6klb.png","v1514072807/rescaled_15d890f1-Copy-Copy_3_w7sude.png","v1514072808/rescaled_15d890f1-Copy-Copy_f7otzy.png","v1514072407/Shipping-Label_idup2x.png","v1514072408/Shemahin-webshot_vw0oxs.png","v1514072408/Shemahin-webshot_vw0oxs.png"]

var children = hello.concat( unlock, uodaadda, shemahin, hello2, mukti);

for (var i = 0; i < children.length; i++) { 
     text += `
<a data-fancybox="gallery" href="http://res.cloudinary.com/designertariqul/image/upload/${children[i]}">
  <img src="http://res.cloudinary.com/designertariqul/image/upload/w_480/${children[i]}" style="width:160px;">
</a>
     `;
}

document.getElementById('output').innerHTML = text;
</script>

</body>
</html>
```

## Axios Template
```html
<!DOCTYPE html>
<html>
<head>
  <title>s</title>
  <script
  src="http://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

</head>
<body>

  <div id='myDiv'>
    <pre><code>
      
    </code></pre>
  </div>

<script type="text/javascript">
  
  // axios.get('https://api.github.com/users/codeheaven-io')
 //  .then(function (response) {
 //    console.log(response);
 //  })
 //  .catch(function (error) {
 //    console.log(error);
 //  });

function getUser(data) {

axios.post('http://www.ebook777.com/wp-admin/admin-ajax.php?action=wp_rp_load_articles&post_id=' + data + '&from=1&count=500&size=full')
  .then(function (response) {
 var top = response.data

 if (top.constructor.name == "Array") {
   top.forEach(function(entry) {
   delete entry["excerpt"];
   delete entry["date"];
   delete entry["img"];
   delete entry["comments"];
   delete entry["title"];
});
} else {
  top = response.data
}

var hello = {
  id: data,
  response: top
}

axios.post('http://localhost:3000/post/', hello)
  .then(function (response) {
   
  })
  .catch(function (error) {
    
  });

console.log(hello);
// $("#myDiv > pre > code").append(JSON.stringify(response.data));

    // document.write(JSON.stringify(response.data));

  })
  .catch(function (error) {
     console.log(error);
  });

             } 

getUser(10004);
getUser(10005);
getUser(10006);
getUser(10007);
getUser(10008);
getUser(10009);
getUser(10010);
getUser(10011);
getUser(10012);
getUser(10013);
getUser(10014);
getUser(10015);
getUser(10016);
getUser(10017);
getUser(10018);
getUser(10019);

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





## Html Preload template
[Preload Link](http://smallenvelop.com/display-loading-icon-page-loads-completely/).

```html
<!DOCTYPE html>
<html class="no-js">

<head>
  <meta charset='UTF-8'>
  
  <title>SmallEnvelop : Simple PreLoader</title>
  
<style>
/* Paste this css to your style sheet file or under head tag */
/* This only works with JavaScript, 
if it's not present, don't show loader */
.no-js #loader { display: none;  }
.js #loader { display: block; position: absolute; left: 100px; top: 0; }
.se-pre-con {
  position: fixed;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 100%;
  z-index: 9999;
  background: url(images/loader-64x/Preloader_2.gif) center no-repeat #fff;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
<script>
  //paste this code under head tag or in a seperate js file.
  // Wait for window load
  $(window).load(function() {
    // Animate loader off screen
    $(".se-pre-con").fadeOut("slow");;
  });
</script>

</head>

<body>
  <!-- Paste this code after body tag -->
  <div class="se-pre-con"></div>
  <!-- Ends -->
  
  <div class="content">
  <div class="back-to-article"><p><a href="smallenvelop.com/blog/"><< Back to the article !!</a></p></div>
  <img src="http://paulryan.com.au/wp-content/uploads/2015/01/high-resolution-wallpapers-25.jpg" style="visibility: hidden; width:100%; height: auto;">
  </div>
  <style>
    .content {
      background: url('http://paulryan.com.au/wp-content/uploads/2015/01/high-resolution-wallpapers-25.jpg') center no-repeat;
      background-size: 100%;
      width: 100%;
    }
  </style>
</body>
Copyright © 2014 SmallEnvelop.com
</html>
```