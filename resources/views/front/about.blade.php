@extends('layouts.main');

@section('page-title')| О компании@endsection
@section('content-title')О магазине@endsection

@section('main-content')
    <div class="news-block content-text"><img src="/img/cover/game-3.jpg" alt="Image" class="alignleft img-news">
        <p>
            Интернет-магазин компьютерных игр ГЕЙМСМАРКЕТ - это онлайн-магазин игр для геймеров, существующий на рынке уже 5 лет. У нас широкий спектр лицензионных игр на компьютер, ключей для игр - для активации и авторизации, а также карты оплаты (game-card, time-card, игровые валюты и т.д.), коды продления и многое друго. Также здесь всегда можно узнать последние новости из области онлайн-игр для PC. На сайте предоставлены самые востребованные и актуальные товары MMORPG, приобретение которых здесь максимально удобно и, что немаловажно, выгодно!
        </p>

    </div>
@endsection

@section('content-bottom')
    @include('front.content-bottom');
@endsection