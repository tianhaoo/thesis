<aside class="col-md-4 blog-aside">
                    
                
                    <div class="aside-widget">
                        <header>
                            <h3>Latest Post</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                            @foreach($latestPosts as $latestPost)
                                <li><a href="/post/{{ $latestPost->slug }}">{{ $latestPost->title }}</a></li>
                            @endforeach
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>Categories</h3>
                        </header>
                        <div class="body">
                            <ul class="clean-list">
                                @foreach($categories as $category)
                                    <li><a href="/category/{{ $category->id }}">{{ $category->name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>

                    <div class="aside-widget">
                        <header>
                            <h3>Tags</h3>
                        </header>
                        <div class="body clearfix">
                            <ul class="tags">
                                @foreach($tags as $tag)
                                    <li><a href="/tags/{{ $tag->name }}">{{ $tag->name }}</a></li>
                                @endforeach
                            </ul>
                        </div>
                    </div>
                </aside>