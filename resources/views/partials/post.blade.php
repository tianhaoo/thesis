<div class="row">
    <div class="col-md-6 col-sm-6">
        <article class=" blog-teaser">
            <header>
                <img src="/storage/{{ $post1->image }}" alt="">
                <h3><a href="/post/{{ $post1->slug }}">{{ $post1->title }}</a></h3>
                <hr>
                <i class="fa fa-user"></i> {{ $post1->author->name }} &nbsp; <i class="fa fa-calendar"></i> {{ $post1->created_at->format('F d, Y')}} &nbsp; <i class="fa fa-thumbs-up"></i>{{ $post1->featured }} Featured
                <hr>
                <span class="meta">{{ $post1->excerpt }}</span>
                <hr>
            </header>
        
        </article>
    </div>

    @if(isset($post2))
    <div class="col-md-6 col-sm-6">
        <article class="blog-teaser">
            <header>
                <img src="/storage/{{ $post2->image }}" alt="">
                <h3><a href="/post/{{ $post2->slug }}">{{ $post2->title }}</a></h3>
                <hr>
                <i class="fa fa-user"></i> {{ $post2->author->name }} &nbsp; <i class="fa fa-calendar"></i> {{ $post2->created_at->format('F d, Y')}} &nbsp; <i class="fa fa-thumbs-up"></i>{{ $post2->featured }} Featured
                <hr>
                <span class="meta">{{ $post2->excerpt }}<</span>
                <hr>
            </header>
        
        </article>
    </div>
    @endif
</div>