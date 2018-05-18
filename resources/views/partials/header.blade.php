
<!--         <div class="widewrapper subheader">
            <div class="container">
                <div class="clean-breadcrumb">
                    <a href="{{ url('/blog') }}">Blog </a>
                </div>


                @if(isset($nav))
                <div class="clean-breadcrumb">
                    <a href="#">/{{ $nav }}</a>
                </div>
                @endif

                <div class="clean-searchbox">
                    <form action="#" method="get" accept-charset="utf-8">
                        <input class="searchfield" id="searchbox" type="text" placeholder="Search">
                        <button class="searchbutton" type="submit">
                            <i class="fa fa-search"></i>
                        </button>
                    </form>
                </div>
            </div>
        </div> -->



<!-- header-section-starts-here -->
    <div class="header">
        <div class="header-top">
            <div class="wrap">
                <div class="top-menu">
                        <ul>   
                            <li>
                                <a href="/admin/profile">欢迎你 {{ Auth::user()->name }}</a>
                            </li> 
                            <li>
                                <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
                            </li> 
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">{{ csrf_field() }}</form>                  
                        </ul>
                </div>

                <div class="num">
                    <p> Call us : 032 2352 782</p>
                </div>
                <div class="clearfix"></div>

            </div>

        </div>
        <div class="header-bottom">
<!--            <div class="logo text-center">
                <a href="index.html"><img src="images/logo.jpg" alt="" /></a>
            </div> -->
            <div class="navigation">
                <nav class="navbar navbar-default" role="navigation">
           <div class="wrap">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                
            </div>
            <!--/.navbar-header-->
        
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="/">Home</a></li>
                    <li><a href="/admin" target="_blank">Admin</a></li>
                    <li><a href="/admin/posts/create" target="_blank">Add New Post</a></li>
                    <div class="clearfix"></div>
                </ul>
                <div class="search">
                    <!-- start search-->
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <form>
                                <input class="sb-search-input" placeholder="Enter your search term..." type="search" name="search" id="search">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"> </span>
                            </form>
                        </div>
                    </div>
                    <!-- search-scripts -->
                    <script src="{{ URL::asset('js/classie.js') }}"></script>
                    <script src="{{ URL::asset('js/uisearch.js') }}"></script>
                        <script>
                            new UISearch( document.getElementById( 'sb-search' ) );
                        </script>
                    <!-- //search-scripts -->
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <!--/.navbar-collapse-->
     <!--/.navbar-->
            </div>
        </nav>
        </div>
    </div>
    <!-- header-section-ends-here -->

