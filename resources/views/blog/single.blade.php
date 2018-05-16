@extends('layouts.blog')

@section('content')
    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-8 blog-main">
                    <article class="blog-post">
                        <header>
                           
                            <div class="lead-image">
                                <img src="/storage/{{ $post->image }}" alt="" class="img-responsive">
                                
                            </div>
                        </header>
                        <div class="body">
                            <h1>{{ $post->title }}</h1>
                                <div id="msg-success" class="alert alert-success" style="display: none"></div>
                                <div id="msg-warning" class="alert alert-warning" style="display: none"></div>
                                <div id="msg-error" class="alert alert-error" style="display: none"></div>

                                <i class="fa fa-user"></i> {{ $post->author->name }} &nbsp; <i class="fa fa-calendar"></i> {{ $post->created_at->format('F d, Y')}} &nbsp; <i class="fa fa-comments"></i><span class="data"><a href="#comments">3 Comments</a></span> &nbsp; <i class="fa fa-thumbs-up"></i><i id="thumb-featured">{{ $post->featured }}</i> <a id="thumbs" href="javascript::" onclick="thumbs({{ $post->id }})">Featured</a>&nbsp;
                                @if(isset($category->name))<i class="fa fa-archive"></i> {{ $category->name }}@endif @if(isset($post->annex))<i class="fa fa-archive"></i><a href="/storage/{{ json_decode(substr($post->annex, 1,strlen($post->annex)-2), true)['download_link'] }}">{{ json_decode(substr($post->annex, 1,strlen($post->annex)-2), true)['original_name'] }}</a> @endif 

                                <!--异步加载点赞-->
                                <script type="text/javascript">
                                    function thumbs(id){
                                        $.ajax({
                                            type: 'POST',
                                            url: '/ajax/thumbs',
                                            data: { id : id },
                                            dataType: 'json',
                                            headers: {
                                            'X-CSRF-TOKEN': $('meta[name="_token"]').attr('content')
                                            },
                                            success: function(data){
                                                if(data.status == 0){
                                                    $("#msg-success").text("点赞成功");
                                                    $("#msg-success").css("display", "");
                                                    $('#msg-success').delay(1000).slideUp(300);
                                                    $('#thumb-featured').text(data.featured);
                                                }else if(data.status==1){
                                                    $("#msg-warning").text("已经点过赞啦");
                                                    $("#msg-warning").css("display", "");
                                                    $('#msg-warning').delay(1000).slideUp(300);
                                                }else{
                                                    $("#msg-wrong").text("服务器错误，请联系管理员");
                                                    $("#msg-wrong").css("display", "");
                                                    $('#msg-wrong').delay(1000).slideUp(300);
                                                }


                                            },
                                            error: function(xhr, type){
                                            alert("Oops, Ajax errpr.");
                                            }
                                            
                                        });
                                    };

                                    
                                </script>
                        </div>
                        <hr>
                            {!! Parsedown::instance()->setMarkupEscaped(true)->text($post->body) !!}
                        
                    </article>
                    <br>
                    @include('partials.comments')

                </div>
                @include('partials.aside')
            </div>
        </div>
    </div>

   


@stop