<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;

class AboutController extends Controller
{
    public function index()
    {
        $pros = Product::orderBy('created_at', 'desc')->take(14)->get();
        //
        $latestProds = Product::orderBy('created_at', 'desc')->take(3)->get();

        return view('front.about', ['latest_products' => $latestProds], compact('pros'));
    }
}
