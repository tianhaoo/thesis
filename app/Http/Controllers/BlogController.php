<?php

namespace App\Http\Controllers;

use App\Post;
use App\tag;
use App\Post_tags;
use App\User;
use App\Category;
use App\user_post_thumbs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BlogController extends Controller
{
	/**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    //
    public function index(){

        $posts = Post::simplePaginate(8);
        $featuredPosts = Post::featuredPosts(4);
        $latestPosts = Post::latestPosts(4);
        $tags = Tag::all();
        $categories = Category::all();

    	return view('blog.index', ['posts' => $posts, 'featuredPosts' => $featuredPosts, 'latestPosts' => $latestPosts, 'tags' => $tags, 'categories' => $categories]);
    }

    public function show($slug){
        $post = Post::findBySlug($slug);
        $comments = $post->comments;
        $category = $post->category;

        $categories = Category::all();

        $featuredPosts = Post::featuredPosts(4);
        $latestPosts = Post::latestPosts(4);
        $tags = Tag::all();

        foreach($comments as $comment){
            $comment['avatar'] = User::find($comment['user_id'])->avatar;
            $comment['name'] = User::find($comment['user_id'])->name;
        }

        return view('blog.single', ['post' => $post, 'featuredPosts' => $featuredPosts, 'latestPosts' => $latestPosts, 'tags' => $tags, 'comments' => $comments, 'category' => $category, 'categories' => $categories, 'nav' => $post->title]);
    }

    public function tagShow($tag) {

        $featuredPosts = Post::featuredPosts(4);
        $latestPosts = Post::latestPosts(4);
        $tags = Tag::all();
        $categories = Category::all();

        $tag = Tag::where('name', $tag)->first();
        $posts = $tag->posts->all();



        return view('blog.index', ['posts' => $posts, 'featuredPosts' => $featuredPosts, 'latestPosts' => $latestPosts, 'tags' => $tags, 'categories' => $categories, 'nav' => 'tags']);     
    }

    public function categoryShow ($id) {
        $featuredPosts = Post::featuredPosts(4);
        $latestPosts = Post::latestPosts(4);
        $tags = Tag::all();
        $categories = Category::all();

        $category = Category::find($id);
        $posts = $category->posts;

        return view('blog.index', ['posts' => $posts, 'featuredPosts' => $featuredPosts, 'latestPosts' => $latestPosts, 'tags' => $tags, 'categories' => $categories, 'nav' => 'categories']); 

    }


    // ajax请求调用的函数
    public function thumbs(Request $request){
        $user_id = Auth::id();
        $post_id = $request->input('id');
        $record = user_post_thumbs::where(['user_id' => $user_id, 'post_id' => $post_id])->get();

        $post = Post::find($post_id);

        if($record->first()){
            return response()->json(array(
                'status' => 1, // 已经点赞过了
                'msg' => 'buok'
                ));
        }else if(!$record->first()){

            $post->featured = $post->featured+1;
            $newRecord = new user_post_thumbs;
            $newRecord->post_id = $post_id;
            $newRecord->user_id = $user_id;
            $newRecord->save();
            if($post->save()){ 
                return response()->json(array(
                    'status' => 0, // 第一次点赞，一切正常
                    'msg' => 'ojbk',
                    'featured' => $post->featured
                ));
            } else {
                return response()->json(array(
                    'status' => 2, // 出错了
                    'msg' => 'xiangdangbuok'
                ));
            }   
        }else{
            return response()->json(array(
                'status' => 2, // 出错了
                'msg' => 'xiangdangbuok'
            ));
        }
    }

       
}
