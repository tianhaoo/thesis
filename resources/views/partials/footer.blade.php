<!-- footer-section-starts-here -->
    <div class="footer">
        <div class="footer-top">
            <div class="wrap">
                <div class="col-md-3 col-xs-6 col-sm-4 footer-grid">
                    <h4 class="footer-head">About Us</h4>
                    <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</p>
                    <p>The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here.</p>
                </div>
                <div class="col-md-2 col-xs-6 col-sm-2 footer-grid">
                    <h4 class="footer-head">Categories</h4>
                    <ul class="cat">
                        @foreach($categories as $category)
                        <li><a href="/category/{{ $category->id }}">{{ $category->name }}</a></li>
                        @endforeach
                    </ul>
                </div>
                <div class="col-md-4 col-xs-6 col-sm-6 footer-grid">
                    <h4 class="footer-head">Flickr Feed</h4>
                    <ul class="flickr">
                        <li><a href="#"><img src="{{ URL::asset('images/bus4.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/bus2.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/bus3.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/tec4.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/tec2.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/tec3.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/bus2.jpg') }}"></a></li>
                        <li><a href="#"><img src="{{ URL::asset('images/bus3.jpg') }}"></a></li>
                        <div class="clearfix"></div>
                    </ul>
                </div>
                <div class="col-md-3 col-xs-12 footer-grid">
                    <h4 class="footer-head">Contact Us</h4>
                    <span class="hq">Our headquaters</span>
                    <address>
                        <ul class="location">
                            <li><span class="glyphicon glyphicon-map-marker"></span></li>
                            <li>CENTER FOR FINANCIAL ASSISTANCE TO DEPOSED NIGERIAN ROYALTY</li>
                            <div class="clearfix"></div>
                        </ul>   
                        <ul class="location">
                            <li><span class="glyphicon glyphicon-earphone"></span></li>
                            <li>+0 561 111 235</li>
                            <div class="clearfix"></div>
                        </ul>   
                        <ul class="location">
                            <li><span class="glyphicon glyphicon-envelope"></span></li>
                            <li><a href="mailto:info@example.com">mail@example.com</a></li>
                            <div class="clearfix"></div>
                        </ul>                       
                    </address>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="footer-bottom">
            <div class="wrap">
                <div class="copyrights col-md-6">
                    <p>&copy; 苏州大学538实验室 <a href="https://Tianhaoo.github.io"  target="_blank">Tianhaoo</a></p>
                </div>
                <div class="footer-social-icons col-md-6">
                    <ul>
                        <li><a class="facebook" href="#"></a></li>
                        <li><a class="twitter" href="#"></a></li>
                        <li><a class="flickr" href="#"></a></li>
                        <li><a class="googleplus" href="#"></a></li>
                        <li><a class="dribbble" href="#"></a></li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- footer-section-ends-here -->