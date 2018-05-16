<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    //
    public function author(){
    	return $this->belongsTo(User::class, 'author_id');
    }

    public function tags()
    {
        return $this->belongsToMany('App\Tag', 'post_tags');
    }

    public function comments()
    {
        return $this->hasMany('App\Comment');
    }

    public function category()
    {
        return $this->belongsTo('App\Category');
    }


    public static function featuredPosts($num) {
    	return static::where('id', '>', '0')
               ->orderBy('featured', 'desc')
               ->take($num)
               ->get();
    }

    public static function latestPosts($num) {
    	return static::where('id', '>', '0')
    			->orderBy('updated_at', 'desc')
    			->take($num)
    			->get();
    }


    public static function findBySlug($slug) {
    	return static::where('slug', $slug)->first();
    }

    public static function findById($id) {
    	return static::where('id', $id)->first();
    }
}
