<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Home</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width">

    <!-- Bootstrap styles -->
    <link rel="stylesheet" href="{{ URL::asset('css/bootstrap.min.css') }}">
   
    <!-- Font-Awesome -->
    <link rel="stylesheet" href="{{ URL::asset('css/font-awesome/css/font-awesome.min.css') }}">

    <!-- Google Webfonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600|PT+Serif:400,400italic' rel='stylesheet' type='text/css'>

    <!-- Styles -->
    <link rel="stylesheet" href="{{ URL::asset('css/style.css') }}" id="theme-styles">


    <meta name="_token" content="{{ csrf_token() }}">

    <!--[if lt IE 9]>      
        <script src="js/respond.js"></script>
    <![endif]-->
    
</head>
<body>
    @include('partials.header')
    

    @yield("content")


    @include('partials.footer')
    
    
    <script src="{{ URL::asset('js/jquery.min.js') }}"></script>
    <script src="{{ URL::asset('js/bootstrap.min.js') }}"></script>
    <script src="{{ URL::asset('js/modernizr.js') }}"></script>

</body>
</html>