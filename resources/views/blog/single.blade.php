@extends('layouts.blog')

@section('content')
<div class="main-body">
		<div class="wrap">
		<ol class="breadcrumb">
			  <li><a href="/">Home</a></li>
			  <li class="active">{{ $title }}</li>
			</ol>
			<div class="single-page">

				<div class="col-md-2 share_grid">
					<h3>SHARE</h3>
					<ul>
						<li>
							<a href="#">
								<i class="facebook"></i>
								<div class="views">
									<span>SHARE</span>
									<label>180</label>	
								</div>			
								<div class="clearfix"></div>
							</a>
						</li>
						<li>
							<a href="#">
								<i class="twitter"></i>
								<div class="views">
									<span>TWEET</span>
									<label>355</label>	
								</div>			
								<div class="clearfix"></div>				
							</a>
						</li>
						<li>
							<a href="#">
								<i class="linkedin"></i>
								<div class="views">
									<span>SHARES</span>
									<label>28</label>	
								</div>			
								<div class="clearfix"></div>								
							</a>
						</li>
						<li>
							<a href="#">
								<i class="pinterest"></i>
								<div class="views">
									<span>PIN</span>
									<label>16</label>	
								</div>			
								<div class="clearfix"></div>				
							</a>
						</li>
						<li>
							<a href="#">
								<i class="email"></i>
								<div class="views">
									<span>Email</span>	
								</div>			
								<div class="clearfix"></div>			
							</a>
						</li>
					</ul>
				</div>

			<!-- // 文章主体	 -->
			<div class="col-md-6 content-left single-post">
				<div class="blog-posts">
			<h3 class="post">{{ $post->title }}</h3>
			<i class="fa fa-user"></i> {{ $post->author->name }} &nbsp; <i class="fa fa-calendar"></i> {{ $post->created_at->format('F d, Y')}} &nbsp; <i class="fa fa-comments"></i><span class="data">{{ count($comments) }}<a href="#comments"> Comments</a></span> &nbsp; <i class="fa fa-thumbs-up"></i><i id="thumb-featured"></i>{{ $post->featured }} <a id="thumbs" href="javascript:" onclick="thumbs({{ $post->id }})">Featured</a>&nbsp;
                                @if(isset($category->name))<i class="fa fa-archive"></i> {{ $category->name }}@endif @if(isset($post->annex))<i class="fa fa-folder"></i><a href="/storage/{{ json_decode(substr($post->annex, 1,strlen($post->annex)-2), true)['download_link'] }}">{{ json_decode(substr($post->annex, 1,strlen($post->annex)-2), true)['original_name'] }}</a> @endif 
                                <hr>
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
            <!-- 评论函数 -->
            @if (session('status_successful'))
            <script type="text/javascript">
            	$(document).ready(function(){
		           	$("#msg-success").text("{{ session('status_successful')}}");
	                $("#msg-success").css("display", "");
	                $('#msg-success').delay(1000).slideUp(300);

				});
            </script>
			@endif

			@if (session('status_fail'))
            <script type="text/javascript">
            	$(document).ready(function(){
		           	$("#msg-wrong").text("{{ session('status_fail')}}");
	                $("#msg-wrong").css("display", "");
	                $('#msg-wrong').delay(1000).slideUp(300);
				});
            </script>
			@endif
			@if (session('status_warning'))
            <script type="text/javascript">
            	$(document).ready(function(){
		           	$("#msg-warning").text("{{ session('status_warning')}}");
	                $("#msg-warning").css("display", "");
	                $('#msg-warning').delay(1000).slideUp(300);
				});
            </script>
			@endif

			<div class="clearfix"></div>

				<div class="last-article">
					{!! $post->body !!}
					<ul class="categories">
						@foreach($tags as $tag)
						<li><a href="/tags/{{$tag->name}}">{{ $tag->name }}</a></li>
						@endforeach

					</ul>
					<div class="clearfix"></div>


				@include('partials.comments')

				<div class="clearfix"></div>
			</div>
		</div>

				</div>
		@include('partials.aside')
			<div class="clearfix"></div>
		</div>
		</div>
	</div>


@stop