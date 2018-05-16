@extends('layouts.blog')


@section('content')
    <div class="widewrapper main">
        <div class="container">
            <div class="row">
                <div class="col-md-8 blog-main">


                @for ($i = 0; $i < sizeof($posts); $i++)
                    @if($i%2==0 and $i!=sizeof($posts)-1)
                        @include('partials.post', ['post1' => $posts[$i], 'post2' =>$posts[$i+1]])
                    @elseif(sizeof($posts)%2!=0 and $i==sizeof($posts)-1)
                        @include('partials.post', ['post1' => $posts[$i]])
                    @endif
                @endfor                              

                    <div class="paging">
                        @if(isset($posts->Links))
                        {{ $posts->Links() }}
                        @endif
                    </div>
                </div>


                
                @include('partials.aside')

                
            </div>
        </div>
    </div>

@stop
