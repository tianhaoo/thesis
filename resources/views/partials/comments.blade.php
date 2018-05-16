                    <aside>
                        <div>
                                @foreach($post->tags as $tag)
                                     <i class="fa fa-tag"></i>{{ $tag->name }} &nbsp;   
                                @endforeach
                        </div>
                    </aside>

                    <aside class="comments" id="comments">
                        <hr>

                        <h2><i class="fa fa-comments"></i> {{ count($comments) }} <a href="#create-comment">Comments</a></h2>

                        @if (session('status_successful'))
                            <div id="comment-sign-successful" class="alert alert-success">
                                {{ session('status_successful') }}
                            </div>
                        @endif

                        @if (session('status_fail'))
                            <div id="comment-sign-wrong" class="alert alert-wrong">
                                {{ session('status_fail') }}
                            </div>
                        @endif

                        @if (session('status_warning'))
                            <div id="comment-sign-waring" class="alert alert-warning">
                                {{ session('status_warning') }}
                            </div>
                        @endif



                        @foreach($comments as $comment)
                        <article class="comment">
                            <header class="clearfix">
                                <img src="/storage/{{ $comment->avatar }}" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="#">{{ $comment->name }}</a></h3>
                                    <span class="date">
                                        {{ $comment->updated_at }}
                                    </span>

                                    @if(Auth::id() == $comment->user_id)
                                    <span class="separator">
                                        -
                                    </span>

                                        <a href="#"
                                            onclick="event.preventDefault();
                                                     document.getElementById('delete-form').submit();">
                                            Delete
                                        </a>

                                        <form id="delete-form" action="/comment/delete/{{ $comment->id }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>


                                    @endif               
                                </div>
                            </header>
                             <div class="body">
                               {{ $comment->content }}
                            </div>
                        @endforeach
                        </article>

                        <!-- 二级评论 -->
                        <!-- <article class="comment reply">
                            <header class="clearfix">
                                <img src="img/avatar.png" alt="A Smart Guy" class="avatar">
                                <div class="meta">
                                    <h3><a href="#">John Doe</a></h3>
                                    <span class="date">
                                        24 August 2015
                                    </span>
                                    <span class="separator">
                                        -
                                    </span>
                                    
                                    <a href="#create-comment" class="reply-link">Reply</a>                
                                </div>
                            </header>
                             <div class="body">
                               Lorem ipsum dolor sit amet, consectetur adipisicing elit. Facere sit perspiciatis debitis, vel ducimus praesentium expedita, assumenda ipsum cum corrupti dolorum modi. Rem ipsam similique sapiente obcaecati tenetur beatae voluptatibus.
                            </div>
                        </article> -->

     
                    </aside>

                    <aside class="create-comment" id="create-comment">
                        <hr>    

                        <h2><i class="fa fa-pencil"></i> Add Comment</h2>

                        <form action="/comment/create" method="post" accept-charset="utf-8">
                            {{ csrf_field() }}
                                    <input type="hidden" name="user_id" id="comment-user" class="form-control input-lg" value="{{ Auth::id() }}">    
                                    <input type="hidden" name="post_id" id="comment-post" class="form-control input-lg" value="{{ $post->id }}">    


                            

                            <textarea rows="10" name="content" id="comment-content" placeholder="Your Comment" class="form-control input-lg"></textarea>

                            <div class="buttons clearfix">
                                <button type="submit" class="btn btn-xlarge btn-clean-one">Submit</button>
                            </div>
                        </form>
                    </aside>