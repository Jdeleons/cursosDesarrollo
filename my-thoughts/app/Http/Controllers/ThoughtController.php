<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Thought;

class ThoughtController extends Controller
{
	public function _contruct(){
		$this->middleware('middleware', 'auth');

	}

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
		 return Thought::where('user_id', auth()->id())->get();
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $thought = new thought();
		  $thought->description=$request->description;
		  $thought->user_id=auth()->id();
		  $thought->save();
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
		 $thought = Thought::find($id);
		 $thought->description=$request->description;

		 $thought->save();

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
		 $thought = Thought::find($id);

		 $thought->delete();

    }
}
