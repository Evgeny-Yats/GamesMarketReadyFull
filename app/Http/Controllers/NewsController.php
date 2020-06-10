<?php

namespace App\Http\Controllers;

use App\CustomClasses\Pagination;
use App\News;
use App\Product;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    public function index(Request $request)
    {
        $pros = Product::orderBy('created_at', 'desc')->take(14)->get();
        //
        $news = News::orderBy('created_at', 'desc')->get();
        $pagination = new Pagination($news, 2, $request);

        return view('front.news', ['newsPagination' => $pagination], compact('pros'));
    }

    public function article($news_id)
    {
        $pros = Product::orderBy('created_at', 'desc')->take(14)->get();
        //
        $news = News::find($news_id);

        $latestProds = Product::orderBy('created_at', 'desc')->take(3)->get();
        $data = [
            'news' => $news,
            'latest_products' => $latestProds
        ];

        return view('front.article', $data, compact('pros'));
    }
}
