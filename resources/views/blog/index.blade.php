@extends('layouts.blog')


@section('content')



<div class="main-body">
        <div class="wrap">
            <div class="col-md-8 content-left">
<!--                <div class="slider">
                    <div class="callbacks_wrap">
                        <ul class="rslides" id="slider">
                            <li>
                                <img src="images/3.jpg" alt="">
                                <div class="caption">
                                    <a href="single.html">Lorem Ipsum is simply dummy text of the printing and typesetting industry</a>
                                </div>
                            </li>
                            <li>
                                <img src="images/2.jpg" alt="">
                                <div class="caption">
                                    <a href="single.html">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque</a>
                                </div>
                            </li>
                            <li>
                                <img src="images/1.jpg" alt="">
                                <div class="caption">
                                    <a href="single.html">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div> -->
                <div class="articles">
                    <header>
                        <h3 class="title-head">{{ $title }}</h3>
                    </header>
                    @foreach($posts as $post)
                    <div class="article">
                        <div class="article-left">
                            <a href="single.html"><img src="/storage/{{ $post->image }}" alt=""></a>
                        </div>
                        <div class="article-right">
                            <div class="article-title">
                                <p>On {{ $post->created_at->format('F d, Y')}}  by {{$post->author->name }} <span class="glyphicon glyphicon-thumbs-up"></span>{{ $post->featured }}</a></p>
                                <a class="title" href="/post/{{ $post->slug }}">{{ $post->title }}</a>
                            </div>
                            <div class="article-text">
                                {{ $post->excerpt }}
                                <a href="/post/{{$post->slug}}"><img src="images/more.png" alt="" /></a>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    @endforeach


                </div>
                @if(method_exists($posts, 'Links'))
                {{ $posts->Links() }}
                @endif
                </div>
            @include('partials.aside')
            <div class="clearfix"></div>
        </div>
    </div>
    <!-- content-section-ends-here -->

@stop