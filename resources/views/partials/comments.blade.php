

<div id="comments" class="response">
    <h4>Responses</h4>

    @foreach($comments as $comment)
    <div class="media response-info">
        <div class="media-left response-text-left">
            <a href="#">
                <img src="/storage/{{ $comment->avatar }}" alt="A Smart Guy" class="avatar">
            </a>
            <h5><a href="#">{{ $comment->name }}</a></h5>
        </div>
        <div class="media-body response-text-right">
            {{ $comment->content }}
            <ul>
                <li> {{ $comment->updated_at }}</li>

                @if(Auth::id() == $comment->user_id)
                        <li>
                        <a href="#"
                            onclick="event.preventDefault();
                                     document.getElementById('delete-form').submit();">
                            - Delete
                        </a>
                        </li>
                        <form id="delete-form" action="/comment/delete/{{ $comment->id }}" method="POST" style="display: none;">
                            {{ csrf_field() }}
                        </form>


                @endif
                
            </ul>       
        </div>
        <div class="clearfix"> </div>
    </div>
        @endforeach

    <div class="coment-form">
        <h4>Leave your comment</h4>
            <form action="/comment/create" method="post" accept-charset="utf-8">
                {{ csrf_field() }}
                <input type="hidden" name="user_id" id="comment-user" class="form-control input-lg" value="{{ Auth::id() }}">    
                <input type="hidden" name="post_id" id="comment-post" class="form-control input-lg" value="{{ $post->id }}">    


        
                <textarea name="content" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Your Comment...';}" required="">Your Comment...</textarea>
                <input type="submit" value="Submit Comment" >
            </form>
    </div>  
    <div class="clearfix"></div>
</div>