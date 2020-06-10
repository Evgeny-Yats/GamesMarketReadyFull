<?php

namespace App\Http\Controllers;

use App\Categorie;
use App\ProductsFilter;
use App\CustomClasses\Pagination;
use Illuminate\Http\Request;
use App\Product;

class CategoriesController extends Controller
{
    public function index($categorie_id, Request $request)
    {

        $pros = Product::orderBy('created_at', 'desc')->take(14)->get();
        //
        $cats = Categorie::find($categorie_id);

        $productis = Product::with('categorie')->where('categorie_id', '=', $categorie_id)->orderBy('created_at', 'desc');
        $productis = (new ProductsFilter($productis, $request))->apply()->get();
        $pagination = new Pagination($productis, 6, $request, ['categorie_id' => $categorie_id]);
        $data = [
            'content_title' => 'Игры в разделе ' . Categorie::find($categorie_id)->name,
            'productsPagination' => $pagination,
        ];


        return view('front.categories', $data, compact(['productis', 'cats', 'pros']));
    }
}
