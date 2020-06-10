@extends('layouts.main')
@section('page-title')| Корзина@endsection
@section('content-title')Корзина@endsection

@section('modal-section')
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Заполните форму, и наш менеджер свяжется с Вами</h5>
                    <button type="button" class="close modals__cart-refresh" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="form-row mb-3 modals__message" id="orderMessage"></div>
                            <form id="orderForm" class="" method="POST" action="{{route('cart.send')}}">
                                {{csrf_field()}}
                                <div class="form-row">
                                    <label for="name">Ваше имя</label>
                                    <input id="name" name="name" type="text" class="cart-control">
                                </div>
                                <div class="form-row">
                                    <label for="email">Ваш Email</label>
                                    <input type="email" name="email" id="email" class="cart-control" value="{{\Illuminate\Support\Facades\Auth::user()->email}}">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn-modal dg modals__cart-refresh" data-dismiss="modal">Закрыть</button>
                    <button type="submit" id="orderFormSubmit" form="orderForm" class="btn-modal">Отправить</button>
                </div>
            </div>
        </div>
    </div>
@endsection
<?php $summ = 0?>

@section('main-content')
    <div class="cart-product-list">
        @foreach ($orderPositions as $orderPosition)
            <?php $summ += $orderPosition->product()->withTrashed()->first()->price?>
            <div class="cart-product-list__item">
                <div class="cart-product__item__product-photo"><img src="{{$orderPosition->product()->withTrashed()->first()->pic}}" class="cart-product__item__product-photo__image"></div>
                <div class="cart-product__item__product-name">
                    <div class="cart-product__item__product-name__content">
                        {{$orderPosition->product()->withTrashed()->first()->name}}
                        {{-- <div class="cart-product__item__product-name__content__name">
                            {{$orderPosition->product()->withTrashed()->first()->name}}
                        </div> --}}
                            {{-- <a href="{{route('cart.delete', ['orderPosition_id' => $orderPosition->id])}}">Удалить
                            </a> --}}
                    </div>
                </div>
                <div class="cart-product__item__cart-date">
                    <a href="{{route('cart.delete', ['orderPosition_id' => $orderPosition->id])}}">Удалить
                            </a>
                    <div class="cart-product__item__cart-date__content">{{$orderPosition->created_at->format('d.m.Y')}}</div>
                </div>
                <div class="cart-product__item__product-price"><span class="product-price__value">{{$orderPosition->product()->withTrashed()->first()->price}} рублей</span></div>
            </div>
        @endforeach
        <div class="cart-product-list__result-item">
            <div class="cart-product-list__result-item__text">Итого</div>
            <div class="cart-product-list__result-item__value">{{$summ}} рублей</div>
        </div>
    </div>
@endsection

@section('content-footer')
    @if(!empty($orderPositions))
        <div class="btn-buy-wrap"><a href="" class="btn-buy-order" data-toggle="modal" data-target="#exampleModal">Оформить заказ</a></div>
    @endif
@endsection