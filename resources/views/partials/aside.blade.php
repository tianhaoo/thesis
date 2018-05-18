<div class="col-md-4 side-bar">
    <div class="first_half">
<!--         <div class="newsletter">
            <h1 class="side-title-head">Newsletter</h1>
            <p class="sign">Sign up to receive our free newsletters!</p>
            <form>
                <input type="text" class="text" value="Email Address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Email Address';}">
                <input type="submit" value="submit">
            </form>
        </div> -->
        <div class="categories">
            <header>
                <h3 class="side-title-head">Categories</h3>
            </header>
            <ul>
                @foreach($categories as $category)
                    <li><a href="/category/{{ $category->id }}">{{ $category->name }}</a></li>
                @endforeach
            </ul>
        </div>
        <div class="list_vertical">
                <section class="accordation_menu">
                  <div>
                    <input id="label-1" name="lida" type="radio" checked/>
                   <label for="label-1" id="item1"><i class="ferme"> </i>Latest Posts<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                    <div class="content" id="a1">
                        <div class="scrollbar" id="style-2">
                         <div class="force-overflow">
                            <div class="popular-post-grids">
                                @foreach($latestPosts as $latestPost)
                                <div class="popular-post-grid">       
                                    <div class="post-img">
                                        <a href="single.html"><img src="/storage/{{ $latestPost->image }}" alt="" /></a>
                                    </div>
                                    <div class="post-text">
                                        <a class="pp-title" href="/post/{{ $latestPost->slug }}"> {{ $latestPost->title }}</a>
                                        <p>On {{ $latestPost->created_at->format('F d, Y')}} <!-- <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>3 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p> -->
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                @endforeach
                                
                                
                            </div>
                            </div>
                        </div>
                      </div>
                  </div>
                  <div>
                    <input id="label-2" name="lida" type="radio"/>
                    <label for="label-2" id="item2"><i class="icon-leaf" id="i2"></i>Featured Posts<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                    <div class="content" id="a2">
                       <div class="scrollbar" id="style-2">
                           <div class="force-overflow">
                            <div class="popular-post-grids">
                                @foreach($featuredPosts as $featuredPost)
                                    <div class="popular-post-grid">
                                        <div class="post-img">
                                            <a href="single.html"><img src="/storage/{{$featuredPost->image }}" alt="" /></a>
                                        </div>
                                        <div class="post-text">
                                            <a class="pp-title" href="/post/{{ $featuredPost->slug }}"> {{ $featuredPost->title }}</a>
                                            <p>On {{ $featuredPost->created_at->format('F d, Y')}} <!-- <a class="span_link" href="#"><span class="glyphicon glyphicon-comment"></span>3 </a><a class="span_link" href="#"><span class="glyphicon glyphicon-eye-open"></span>56 </a></p> -->
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
<!--                   <div>
                    <input id="label-3" name="lida" type="radio"/>
                    <label for="label-3" id="item3"><i class="icon-trophy" id="i3"></i>Latest Comments<i class="icon-plus-sign i-right1"></i><i class="icon-minus-sign i-right2"></i></label>
                    <div class="content" id="a3">
                       <div class="scrollbar" id="style-2">
                        <div class="force-overflow">
                         <div class="response">
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>MARCH 21, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>MARCH 26, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>MAY 25, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>FEB 13, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>JAN 28, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>APR 18, 2015</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
                <div class="media response-info">
                    <div class="media-left response-text-left">
                        <a href="#">
                            <img class="media-object" src="images/icon1.png" alt="" />
                        </a>
                        <h5><a href="#">Username</a></h5>
                    </div>
                    <div class="media-body response-text-right">
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,There are many variations of passages of Lorem Ipsum available, 
                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                        <ul>
                            <li>DEC 25, 2014</li>
                            <li><a href="single.html">Reply</a></li>
                        </ul>       
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
            </div>

                        </div>
                    </div>
                  </div> -->
                </section>
             </div>

             </div>
             <div class="secound_half">
             <div class="tags">
                <header>
                    <h3 class="title-head">Tags</h3>
                </header>
                <p>
                @foreach($tags as $tag)
                    <a class="tag{{ $tag->id%20+1 }}" href="/tags/{{ $tag->name }}">{{ $tag->name }}</a>
                @endforeach
                </p>
             </div>                  

        </div>
    <div class="clearfix"></div>
</div>