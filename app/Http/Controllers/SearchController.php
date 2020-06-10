<?php

namespace App\Http\Controllers;

use App\CustomClasses\Pagination;
use Illuminate\Http\Request;
use App\Product;

class SearchController extends Controller
{
    public function index(Request $request)
    {
        $pros = Product::orderBy('created_at', 'desc')->take(14)->get();
        //
        $searchString = $request->all()['search'];
        $prods = Product::where('name', 'like', "%$searchString%")->orderBy('created_at', 'desc')->get();
        $pagination = new Pagination($prods, 6, $request, [], "search=$searchString");

        return view('front.search', ['productsPagination' => $pagination], compact('pros'));
    }
}
