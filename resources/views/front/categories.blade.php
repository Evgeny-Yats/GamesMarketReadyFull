@extends('layouts.main');
@section('page-title')| Товары в категории@endsection
@section('content-title'){{$content_title}}@endsection

@section('main-content')
    <div class="row">
        <div class="col-sm">
            <aside>
                <form action="">

                    {{--<div class="form-group">--}}
                    {{--<label for="name" class="from-control">Категория</label>--}}
                    {{--<select name="name">--}}
                    {{--<option value="1"></option>--}}
                    {{--<option value="2"></option>--}}
                    {{--</select>--}}
                    {{--</div>--}}


                    <div class="d-flex">
                        <div class="form-group namefilter">
                            <label for="name" class="filterLabel">Название</label>
                            <input type="text" class="cart-control dsds" name="name" value="{{ request()->name }}">
                        </div>

                        <div class="form-group d-flex">
                            <div class="filterdiv">
                                <label for="price_from" class="filterLabel">Цена от</label>
                                <input type="text" class="cart-control mini" name="price_from" value="{{ request()->price_from }}">
                            </div>
                            <div class="filterdiv">
                                <label for="price_to" class="filterLabel">Цена до</label>
                                <input type="text" class="cart-control mini" name="price_to" value="{{ request()->price_to }}">
                                <div class="range_slid">
                                    <output for="fader" id="volume">
                                        @if (!is_null(request()->range_price))
                                            {{ request()->range_price }}
                                        @else
                                            0
                                        @endif

                                    </output>
                                    <br>
                                    <br>
                                    <input type="range" name="range_price" class="lall" id="fader" min="0" max="10000"
                                           value="{{ request()->range_price == null ? 0 : request()->range_price}}"
                                           step="1" oninput="outputUpdate(value)">
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn-modal mr">Применить</button>

                    <a href="{{route('categories' , $cats->id)}}" class="resetfilter btn-modal dg mr">Сбросить</a>

                </form>
            </aside>
        </div>
    </div>
    <div class="products-columns">
        @foreach($productsPagination->itemsOnPage as $producti)
            <div class="products-columns__item">
                <div class="products-columns__item__title-product"><a href="{{route('product', ['product_id' => $producti->id])}}" class="products-columns__item__title-product__link">{{$producti->name}}</a></div>
                <div class="products-columns__item__thumbnail"><a href="{{route('product', ['product_id' => $producti->id])}}" class="products-columns__item__thumbnail__link"><img src="{{$producti->pic}}" alt="Preview-image" class="products-columns__item__thumbnail__img"></a></div>
                <div class="products-columns__item__description"><span class="products-price">{{$producti->price}} руб</span><a href="{{route('cart.add', ['product_id' => $producti->id])}}" class="btn-buy">Купить</a></div>
            </div>
        @endforeach
    </div>
@endsection

@section('content-footer')
   {!! $productsPagination->renderPagination() !!}
@endsection
