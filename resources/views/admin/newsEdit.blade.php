@extends('admin.base')

@section('main-content')
    <div class="row mb-3">
        <h2 class="col-lg-12 adminh2">Редактировать новость</h2>
    </div>
    <div class="row mb-3">
        <div class="col-lg-12" style="min-height: 1.5rem; color: red">
            {{$message}}
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <form id="newsForm" enctype="multipart/form-data" method="POST"  action="{{route('admin.news.edit_post', ['news_id' => $news->id])}}">
                {{csrf_field()}}
                <div class="form-group">
                    {{-- <label for="inputTitle">Заголовок</label> --}}
                    <input type="text" name="title" placeholder="Заголовок" class="texsa" id="inputTitle" value="{{$news->title}}">
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="form-group">
                {{-- <label for="inputText">Текст</label> --}}
                <textarea form="newsForm" name="text" id="inputText" placeholder="Текст новости" class="texsa" rows="10">{{$news->text}}</textarea>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="mb-3" style="height: 150px; background-image: url('{{$news->thumbnail}}'); background-size: cover;">
                <img src="" alt="картинка новости" style="display: none;">
            </div>
            <label for="file" class="adminh2">Картинка</label>
            <input form="newsForm" name="thumbnail" type="file" id="file" class="texsa-file mb-3">
        </div>
    </div>
    <div class="row">
        <div class="col-lg-8">
            <div class="form-group">
                {{-- <label for="inputExcerpt">Отрывок</label> --}}
                <textarea form="newsForm" name="excerpt" id="inputExcerpt" placeholder="Отрывок" class="texsa" rows="5">{{$news->excerpt}}</textarea>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 savePrevios">
            <button form="newsForm" type="submit" class="btn_log_reg dn green">Сохранить</button>
            <a href="{{route('admin.news')}}" class="btn_log_reg dn admin3 blue">Назад</a>
            <a href="{{route('admin.news.delete', ['news_id' => $news->id])}}" class="btn_log_reg dn admin3 red">Удалить</a>
        </div>
    </div>
@endsection
