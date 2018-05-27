<?php

namespace webDinamica\Http\Controllers;

use Illuminate\Http\Request;

class frontEnd extends Controller
{
    public function index(){

    	return view('web.index')
    }
}
