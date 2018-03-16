# Exhibition


Exhibition


## Server.js


```javascript
var express = require("express")
var compression = require('compression')
var multer = require('multer')
var axios = require('axios')
var app = express()
var path = require('path')
var Router = require('router')
var router = express.Router();
var helmet = require('helmet')
require('dotenv').config()


var _ = require('lodash');

app.use(express.static('files'))
// compress all responses
app.use(compression())
app.use('/static', express.static(path.join(__dirname, 'files')))

app.use(helmet())

var cloudinary = require('cloudinary');



var sizeOf = require('image-size');

app.use(express.static(path.join(__dirname, 'uploads')));

var mongo = require('mongodb');
var MongoClient = require('mongodb').MongoClient;
var url = process.env.DB_HOST;

const bodyParser = require('body-parser')

var ejs = require('ejs')
app.set('view engine', 'ejs')






app.get('/', function(req, res) {

    // cloudinary.v2.uploader.destroy('speakers/Firefox_Screenshot_2017-02-28T16-56-09113Z-20171101220013_cikpqj', 
    //     {invalidate: true }, function(error, result) {console.log(result)});

    var visitedid = {
        visitedid: req.originalUrl,
    }

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection('visitedid').save(visitedid, (err, result) => {
            if (err) return console.log(err)
            db.close();
        })
    });

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({}).limit(100).toArray(function(err, result) {
            if (err) throw err;
            db.close();
            res.render('home', {
                speakers: result,
                active: req.url,
            });

        });
    });

})

app.get('/page/:id', function(req, res) {

    // cloudinary.v2.uploader.destroy('speakers/Firefox_Screenshot_2017-02-28T16-56-09113Z-20171101220013_cikpqj', 
    //     {invalidate: true }, function(error, result) {console.log(result)});

    var visitedid = {
        visitedid: req.originalUrl,
    }

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection('visitedid').save(visitedid, (err, result) => {
            if (err) return console.log(err)
            db.close();
        })
    });

    var skip = 0;

    console.log(req.url)

    if (req.url == '/page/2') { skip = 100 }
    if (req.url == '/page/3') { skip = 200 }
    if (req.url == '/page/4') { skip = 300 }

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({}).skip(skip).limit(100).toArray(function(err, result) {
            if (err) throw err;
            db.close();
            res.render('home', {
                speakers: result,
                active: req.url,
            });

        });
    });

})

app.get('/most-viewed', function(req, res) {

    // cloudinary.v2.uploader.destroy('speakers/Firefox_Screenshot_2017-02-28T16-56-09113Z-20171101220013_cikpqj', 
    //     {invalidate: true }, function(error, result) {console.log(result)});

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("visitedid").find({}).toArray(function(err, result) {
            if (err) throw err;
            db.close();
            // console.log(result)

            var data = result;

            var result = _(data)
                .groupBy('visitedid')
                .map((items, visitedid) => ({ visitedid, count: items.length }))
                .value();

            result = _.orderBy(result, 'count', 'desc');

            // var hello = _.find(result, { 'visitedid': 'Shahanaj-Parvin-Color-in-Light'});
            // console.log(hello)

            // console.log(result);

            res.render('most-viewed', {
                result: result,
            });

        });
    });

})


app.get('/about', function(req, res) {

            res.render('about', {
                result: 'result',
            });

     
    });







app.get('/api/', function(req, res) {

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({}).toArray(function(err, result) {
            if (err) throw err;
            db.close();
            res.json(result)

        });
    });

})

app.get('/api/:id', function(req, res) {

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("visitedid").find({}).toArray(function(err, result) {
            if (err) throw err;
            db.close();
            // console.log(result)
            // console.log( req.params.id)

            var data = result;

            var result = _(data)
                .groupBy('visitedid')
                .map((items, visitedid) => ({ visitedid, count: items.length }))
                .value();

            result = _.orderBy(result, 'count', 'desc');

            var hello = _.find(result, { 'visitedid': req.params.id });
            // console.log(hello)

            res.json(hello)

        });
    });

})

// app.get('/api/file', function(req, res) {

// // cloudinary.v2.uploader.destroy('speakers/Firefox_Screenshot_2017-02-28T16-56-09113Z-20171101220013_cikpqj', 
// //     {invalidate: true }, function(error, result) {console.log(result)});

//     MongoClient.connect(url, function(err, db) {
//         if (err) throw err;
//         db.collection("exhibition").find({}).toArray(function(err, result) {
//             if (err) throw err;
//             db.close();
//             res.render('index', {
//                 speakers: result,
//             });

//         });
//     });

// })

// app.get('/api/file/update', function(req, res) {

//     MongoClient.connect(url, function(err, db) {
//         if (err) throw err;
//         db.collection("exhibition").find({}).toArray(function(err, result) {
//             if (err) throw err;
//             db.close();
//             res.render('update', {
//                 speakers: result,
//             });

//         });
//     });

// })

var data = []
var storage = multer.diskStorage({
    destination: function(req, file, callback) {
        callback(null, './uploads');

    },
    filename: function(req, file, callback) {
        callback(null, path.basename(file.originalname, path.extname(file.originalname)).replace(/[`~!@#$%^&*()|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '').replace(/ /g, "_") + '-' + getFormattedDate() + path.extname(file.originalname));
        data = path.basename(file.originalname, path.extname(file.originalname)).replace(/[`~!@#$%^&*()|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '').replace(/ /g, "_") + '-' + getFormattedDate() + path.extname(file.originalname);

        // var dimensions = sizeOf('uploads/IMG_0230-20171101072500.JPG');
        // console.log(dimensions.width, dimensions.height);

    }
})

// app.post('/api/file', function(req, res) {
//     var upload = multer({
//         storage: storage,
//         fileFilter: function(req, file, callback) {
//             var ext = path.extname(file.originalname)
//             if (ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg' && ext !== '.GIF' && ext !== '.JPG' && ext !== '.PNG') {
//                 return
//             }
//             callback(null, true)
//         }
//     }).single('userFile');
//     upload(req, res, function(err) {
//         // console.log(req.body);

// cloudinary.v2.uploader.upload("uploads/"+data, {use_filename: true, folder:"exhibition"},
//     function(error, result){
//      // console.log(result);

// var seourl = (req.body.name + '-' + req.body.title).replace(/[`~!@#$%^&*()|+\=?;:'",.<>\{\}\[\]\\\/]/gi, '').replace(/ /g, "-") 

//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//  seourl = (seourl).replace(/--/gi, "-"); 
//         var c = {
//             name: req.body.name,
//             title: req.body.title,
//             seourl: seourl,
//             seo: req.body.seo,
//             batch: req.body.batch,
//             bfa: req.body.bfa,
//             mfa: req.body.mfa,
//             award: req.body.award,
//             image: data,
//         }

//         var artwork = {artwork: result}

//         Object.assign(c, artwork);

//         MongoClient.connect(url, function(err, db) {
//             if (err) throw err;
//             db.collection('exhibition').save(c, (err, result) => {
//                 if (err) return console.log(err)
//                 console.log('saved to database');
//                  db.close();
//                 data = [];
//                 res.redirect('/api/file');
//             })
//         });

//     });

//     })
// })

app.get('/vision/:id', function(req, res, next) {
    // console.log('Request Id:', req.params.id);

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("cloud-vision3").find({ name: req.params.id }).toArray(function(err, result) {
            // console.log(result);
            if (err) throw err;

            res.json(result);

            // var visually = result["0"].vision.responses["0"].webDetection.visuallySimilarImages
            // var colors = result["0"].vision.responses["0"].imagePropertiesAnnotation.dominantColors.colors

            // var tag = result["0"].vision.responses["0"].webDetection.webEntities

            // var name = result["0"].name

            // res.render('vision', {
            //     vision: result,
            //     visually: visually,
            //     colors: colors,
            //     tag: tag,
            //     name: name,

            // });
            db.close();

        });
    });
});

app.get('/related/:id', function(req, res, next) {
    // console.log('Request Id:', req.params.id);

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({ batch: req.params.id }).toArray(function(err, result) {
            // console.log(result);
            if (err) throw err;

            res.json(result);
            db.close();

        });
    });
});

app.get('/nextrelated/:id', function(req, res, next) {
    // console.log('Request Id:', req.params.id);

    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({ batch: req.params.id }).toArray(function(err, result) {
            // console.log(result);
            if (err) throw err;

            res.json(result);
            db.close();

        });
    });
});

app.get('/:id', function(req, res, next) {
    // console.log('Request Id:', req.params.id);
    var pageSpeakers = [];
    var pageview = [];
    MongoClient.connect(url, function(err, db) {
        if (err) throw err;
        db.collection("exhibition").find({}).toArray(function(err, result) {
            // console.log(result);
            if (err) throw err;
            console.log('Request Id:', req.params.id);

            axios.all([
                    axios.get('http://localhost:8000/vision/' + req.params.id)

                ])
                .then(axios.spread(function(userResponse, resmo) {
                    //... but this callback will be executed only when both requests are complete.
                    result.forEach(function(item) {
                        if (item.seourl == req.params.id) {
                            pageSpeakers.push(item);
                        }
                    });

                    if (userResponse.data == false) {
                        res.status(404);
                        res.render('404page', {

                        });
                        return;

                    }

                    var visitedid = {
                        visitedid: req.params.id,
                    }
                    MongoClient.connect(url, function(err, db) {
                        if (err) throw err;
                        db.collection('visitedid').save(visitedid, (err, result) => {
                            if (err) return console.log(err)
                            db.close();
                        })
                    });

                    // console.log(pageSpeakers[0]._id);
                    // db.collection("exhibition").find({pageSpeakers[0]._id : {'$gt': last_id}}).limit(10)
                    var userResponse = userResponse.data
                    var visually = userResponse["0"].vision.responses["0"].webDetection.visuallySimilarImages
                    var colors = userResponse["0"].vision.responses["0"].imagePropertiesAnnotation.dominantColors.colors
                    var tag = userResponse["0"].vision.responses["0"].webDetection.webEntities
                    var name = userResponse["0"].name

                    var batch = pageSpeakers[0].batch

                            res.render('filelink', {
                                speakers: pageSpeakers,
                                visually: visually,
                                colors: colors,
                                tag: tag,
                                name: name,
                                active: req.params.id,
                                batch: batch
                            });
                            db.close();
                            pageSpeakers = [];

                }));
        });
    });
});

var port = process.env.PORT || 8000
app.listen(port, function() {
    console.log('Node.js listening on port ' + port)
})

function getFormattedDate() {
    var date = new Date();
    var month = date.getMonth() + 1;
    var day = date.getDate();
    var hour = date.getHours();
    var min = date.getMinutes();
    var sec = date.getSeconds();
    month = (month < 10 ? "0" : "") + month;
    day = (day < 10 ? "0" : "") + day;
    hour = (hour < 10 ? "0" : "") + hour;
    min = (min < 10 ? "0" : "") + min;
    sec = (sec < 10 ? "0" : "") + sec;
    var str = date.getFullYear() + month + day + hour + min + sec;
    /*alert(str);*/
    return str;
}
```


## View Home.ejs

```html
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>UODA Art Exhibition 2015</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    
<link rel="apple-touch-icon" href="/apple-touch-icon.png" />
<link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png" />
<link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-72x72.png" />
<link rel="apple-touch-icon" sizes="76x76" href="/apple-touch-icon-76x76.png" />
<link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114x114.png" />
<link rel="apple-touch-icon" sizes="120x120" href="/apple-touch-icon-120x120.png" />
<link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144x144.png" />
<link rel="apple-touch-icon" sizes="152x152" href="/apple-touch-icon-152x152.png" />
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon-180x180.png" />

    <meta name="description" content="UODA Art Exhibition 2015. University of Development Alternative, UODA, Dhaka." />
    <meta property="og:site_name" content="UODA Art Exhibition 2015" />
    <meta property="og:title" content="UODA Art Exhibition 2015" />
    <meta property="og:url" content="http://uodaexhibition2015.tariquldesign.com" />
    <meta property="og:description" content="UODA Art Exhibition 2015. University of Development Alternative, UODA, Dhaka." />
     <meta property="og:image" content="http://res.cloudinary.com/topuhit/image/upload/v1510040367/exhibition/banner-facebook-cover.png">
    <link rel="stylesheet" type="text/css" href="/static/style.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
 <script src="/static/cloudinary-core-shrinkwrap.min.js" type="text/javascript"></script>


   <% include content/google.ejs %>

   
    <style>
    body {
        width: 85%;
        margin: 0 auto;
        font-family: monospace;
        color: #555;
        background-color: #ffe9a9;
    }
img {
    margin-bottom: -6px;
    width: 100%;
    /* border-radius: 5px 5px 0px 0px; */
}
    .col-xs-3 {
        width: 30%
    }
      .item {
        float: left;
        width: 300px;
            margin-right: 20px;
    margin-top: 10px;
      }
.text {
    background-color: lightgray;
    border-radius: 4px 4px 20px 20px;
    margin-bottom: 2px;
    padding-top: 5px;
}
.text:hover {
    background-color: #ee8282;
    color: white;
    /* display: block; */
    border-radius: 4px 4px 20px 20px;
    margin-bottom: 2px;
    /* padding-bottom: 3px; */
    padding-top: 5px;
}
h2 {
    font-size: 18px;
    font-weight: bold;
    padding-left: 20px;
        line-height: 1em;
}
h2:hover {
    color: white;
}
div > p {
    padding-left: 20px;
    line-height: 1.5em;
    margin-top: 2px;
    padding-bottom: 10px;
    font-size: 16px;
    padding-right: 10px;
}
a {
    color: inherit;
    text-decoration: none;
}

.full-width{
	width: 100%;
    text-align: center;

    
}



</style>

</head>
<body>

   <% include content/nav.ejs %>

	<div class="full-width">
        <img src="  http://res.cloudinary.com/topuhit/image/upload/v1510067216/exhibition/banner2.svg" srcset="http://res.cloudinary.com/topuhit/image/upload/v1510583814/exhibition/banner3-horizontal.svg 1000w,   http://res.cloudinary.com/topuhit/image/upload/v1510067216/exhibition/banner2.svg 2000w" alt="UODA Art Exhibition 2015. University of Development Alternative, UODA, Dhaka.">
    <h1>UODA Art Exhibition 2015. University of Development Alternative, UODA, Dhaka.</h1>
</div>

   <% include pagination.ejs %>


 <div class="allimages">
        <% speakers.forEach(function(item) { %>
             <div class="item text"  style="">
                <a href="/<%= item.seourl %>"><img data-src="http://res.cloudinary.com/topuhit/image/upload/dpr_auto,w_auto,c_scale/e_sharpen/v<%= item.artwork.version %>/<%= item.artwork.public_id %>.<%= item.artwork.format %>" class="cld-responsive cld-hidpi img-responsive" alt="<%= item.name %> - <%= item.title %>"></a>
                <a href="/<%= item.seourl %>"><div class="" style="width: 100%;"><h2><%= item.name %>
                    <% if (item.award) { %>
<i class="fa fa-certificate" aria-hidden="true" title="Awarded Artwork"></i>
<% } %>

                </h2><p><%= item.title %>
                <%= item.mfa %><%= item.bfa %> - <%= item.batch %></p>
                </div></a>
            </div>
            <%  }); %>
    </div>
    <p></p>

     <% include pagination.ejs %>
     <% include footer.ejs %>



    <script>
    </script>
    <script type="text/javascript">
    var cl = cloudinary.Cloudinary.new({ cloud_name: "topuhit" });
    // replace 'demo' with your cloud name in the line above 
    cl.responsive();
    </script>
<!-- 

████████╗ █████╗ ██████╗ ██╗ ██████╗ ██╗   ██╗██╗         ██████╗ ███████╗███████╗██╗ ██████╗ ███╗   ██╗
╚══██╔══╝██╔══██╗██╔══██╗██║██╔═══██╗██║   ██║██║         ██╔══██╗██╔════╝██╔════╝██║██╔════╝ ████╗  ██║
   ██║   ███████║██████╔╝██║██║   ██║██║   ██║██║         ██║  ██║█████╗  ███████╗██║██║  ███╗██╔██╗ ██║
   ██║   ██╔══██║██╔══██╗██║██║▄▄ ██║██║   ██║██║         ██║  ██║██╔══╝  ╚════██║██║██║   ██║██║╚██╗██║
   ██║   ██║  ██║██║  ██║██║╚██████╔╝╚██████╔╝███████╗    ██████╔╝███████╗███████║██║╚██████╔╝██║ ╚████║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝ ╚══▀▀═╝  ╚═════╝ ╚══════╝    ╚═════╝ ╚══════╝╚══════╝╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                                                                                        

                                                                                                        
Website create on 07/11/2017 

First Node JS and MongoDB Web Development. 369 artworks. Hosted on VPS Server. SEO, Opengraph, Device Pixel Ratio, CDN Optimized, Responsive website.


-->
</body>
</html>

```



## View Pagination.ejs

```html
 <div class="w3-center">
<div class="pagination">
  <a href="/" <%if (active =='/') {%>  class="active"  <%}%>>1</a>
  <a href="/page/2" <%if (active =='/page/2') {%>  class="active"  <%}%>>2</a>
  <a href="/page/3" <%if (active =='/page/3') {%>  class="active"  <%}%>>3</a>
  <a href="/page/4" <%if (active =='/page/4') {%>  class="active"  <%}%>>4</a>

</div>
</div>


```



## View nav.ejs

```html
<div class="app-navigation">
        <div class="navigation-holder">
            <a href="/" class="navigation-link"><span><img src="http://uodaartexhibition2015.ml/anual-art-exhibition-logo-horizontal.svg" class="toplogo" alt="Exhibition Logo"></span></a>
            <a href="/" class="navigation-link"><span><i class="fa fa-home" aria-hidden="true"></i> Home</span></a>
            <a href="/page/2" class="navigation-link"><span> 2</span></a>
            <a href="/page/3" class="navigation-link"><span> 3</span></a>
            <a href="/page/4" class="navigation-link"><span> 4</span></a>
            <a href="/most-viewed" class="navigation-link "><span><i class="fa fa-bar-chart" aria-hidden="true"></i> Most Viewed</span></a>
            <a href="/about" class="navigation-link "><span><i class="fa fa-info-circle" aria-hidden="true"></i> About</span></a>
        </div>
    </div>

<div class="app-navigation-mobile">
        <div class="navigation-holder">
            <a href="/" class="navigation-link"><span><img src="http://uodaartexhibition2015.ml/anual-art-exhibition-logo-horizontal.svg" class="toplogo" alt="Exhibition Logo"></span></a>
            <a href="/" class="navigation-link"><span><i class="fa fa-home" aria-hidden="true"></i></span></a>
            <a href="/page/2" class="navigation-link"><span> 2</span></a>
            <a href="/page/3" class="navigation-link"><span> 3</span></a>
            <a href="/page/4" class="navigation-link"><span> 4</span></a>
            <a href="/most-viewed" class="navigation-link "><span><i class="fa fa-bar-chart" aria-hidden="true"></i></span></a>
            <a href="/about" class="navigation-link "><span><i class="fa fa-info-circle" aria-hidden="true"></i></span></a>
        </div>
    </div>

```



