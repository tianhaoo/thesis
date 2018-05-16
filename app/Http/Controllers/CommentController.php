<?php

namespace App\Http\Controllers;

use App\Comment;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    //
    public function create(Request $request) {
    	$comment = new Comment;
    	$comment->user_id = $request->user_id;
    	$comment->post_id = $request->post_id;
    	$comment->content = $request->content;
    	if($comment->save())
    		return back()->with('status_successful', 'Comment successfully added!');
    	else
    		return back()->with('status_fail', 'Something Wrong happened!');

    }

    public function delete($id) {

    	$comment=Comment::find($id);
    	
    	if($comment->user_id = Auth::id()){    		
	    	if($comment->delete())
	    		return back()->with('status_successful', 'Comment successfully deleted!');
	    	else
	    		return back()->with('status_fail', 'Something Wrong happened!');
    	}
    	else{
    		return back()->with('status_warning', 'You cannot do this!');
    	}
    }
}
