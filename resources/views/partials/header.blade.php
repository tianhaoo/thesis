<header>
        <div class="widewrapper masthead">
            <div class="container">
                <a href="{{ url('/blog') }}" id="logo">
                    <img src="{{ URL::asset('img/logo.png') }}" alt="clean Blog">
                </a>
        
                <div id="mobile-nav-toggle" class="pull-right">
                    <a href="{{ url('/blog') }}" data-toggle="collapse" data-target=".clean-nav .navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>



                <nav class="pull-right clean-nav">
                    <div class="collapse navbar-collapse">
                        <ul class="nav nav-pills navbar-nav">   
                            <li>
                                <a href="/admin">后台管理</a>
                            </li>
                            <li>
                                <a href="/admin/posts/create">新增文章</a>
                            </li>  

                            <li>
                                <a href="/admin/profile">欢迎你 {{ Auth::user()->name }}</a>
                            </li> 
                            <li>
                                <a href="{{ route('logout') }}" onclick="event.preventDefault(); document.getElementById('logout-form').submit();">Logout</a>
                            </li> 
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">{{ csrf_field() }}</form>                  
                        </ul>
                    </div>

                </nav>        

            </div>
        </div>

        <div class="widewrapper subheader">
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
        </div>
    </header>



