<?php

namespace webDinamica\Http\Controllers;

use Illuminate\Http\Request;

class FrontEndController extends Controller
{
	public function index(){

    	return view('web.index');
    }
    
}
