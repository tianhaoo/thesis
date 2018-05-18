<!DOCTYPE html>
<html>
<head>
<title>Thesis</title>
<link href="{{ URL::asset('css/bootstrap.css') }}" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="{{ URL::asset('js/jquery.min.js') }}"></script>
<!-- Custom Theme files -->
<link href="{{ URL::asset('css/style.css') }}" rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Express News Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<meta name="_token" content="{{ csrf_token() }}">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/regular.css" integrity="sha384-EWu6DiBz01XlR6XGsVuabDMbDN6RT8cwNoY+3tIH+6pUCfaNldJYJQfQlbEIWLyA" crossorigin="anonymous">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- for bootstrap working -->
    <script type="text/javascript" src="{{ URL::asset('js/bootstrap.js') }}"></script>
<!-- //for bootstrap working -->
<!-- web-fonts -->
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'>
<!-- Font-Awesome -->
<link rel="stylesheet" href="{{ URL::asset('css/font-awesome/css/font-awesome.min.css') }}">
<script src="{{ URL::asset('js/responsiveslides.min.js') }}"></script>
    <script>
        $(function () {
          $("#slider").responsiveSlides({
            auto: true,
            nav: true,
            speed: 500,
            namespace: "callbacks",
            pager: true,
          });
        });
    </script>
    <script type="text/javascript" src="{{ URL::asset('js/move-top.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/easing.js') }}"></script>
<!--/script-->
<script type="text/javascript">
            jQuery(document).ready(function($) {
                $(".scroll").click(function(event){     
                    event.preventDefault();
                    $('html,body').animate({scrollTop:$(this.hash).offset().top},900);
                });
            });
</script>
</head>

    <!-- header-section-starts-here -->
    @include('partials.header')
    <!-- header-section-ends-here -->

    <!--<div class="wrap">
        <div class="move-text">
            <div class="breaking_news">
                <h2>Breaking News</h2>
            </div>
            <div class="marquee">
                <div class="marquee1"><a class="breaking" href="single.html">>>The standard chunk of Lorem Ipsum used since the 1500s is reproduced..</a></div>
                <div class="marquee2"><a class="breaking" href="single.html">>>At vero eos et accusamus et iusto qui blanditiis praesentium voluptatum deleniti atque..</a></div>
                <div class="clearfix"></div>
            </div>
            <div class="clearfix"></div>
            <script type="text/javascript" src="js/jquery.marquee.min.js"></script>
            <script>
              $('.marquee').marquee({ pauseOnHover: true });
              //@ sourceURL=pen.js
            </script>
        </div>
    </div> -->

<body>
 
    <div id="msg-success" class="alert alert-success" style="display: none"></div>
    <div id="msg-warning" class="alert alert-warning" style="display: none"></div>
    <div id="msg-error" class="alert alert-error" style="display: none"></div>

    <!-- content-section-starts-here -->
    @yield("content")
    <!-- content-section-ends-here -->



    <!-- footer-section-starts-here -->
    @include('partials.footer')
    <!-- footer-section-ends-here -->
    <script type="text/javascript">
        $(document).ready(function() {
                /*
                var defaults = {
                wrapID: 'toTop', // fading element id
                wrapHoverID: 'toTopHover', // fading element hover id
                scrollSpeed: 1200,
                easingType: 'linear' 
                };
                */
        $().UItoTop({ easingType: 'easeOutQuart' });
});
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!---->
</body>
</html>