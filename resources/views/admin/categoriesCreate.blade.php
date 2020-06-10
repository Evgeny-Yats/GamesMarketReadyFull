@extends('admin.base')

@section('main-content')
    <div class="row mb-3">
        <h2 class="col-lg-12 adminh2">Новая категория</h2>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <form method="POST"  action="{{route('admin.categories.create_post')}}">
                {{csrf_field()}}
                <div class="form-group" style="min-height: 1.5rem; color: red">
                    {{$message}}
                </div>
                <div class="form-group">
                    {{-- <label for="inputTitle">Название</label> --}}
                    <input type="text" name="name" placeholder="Название" class="texsa" id="inputTitle" value="{{isset(Request::all()['name']) ? Request::all()['name'] : ''}}">
                </div>
                <div class="form-group">
                    {{-- <label for="inputDesc">Описание</label> --}}
                    <textarea name="description" id="inputDesc" placeholder="Описание" class="texsa" rows="5">{{isset(Request::all()['description']) ? Request::all()['description'] : ''}}</textarea>
                </div>
                <div class="form-group savePrevios">
                    <button type="submit" class="btn_log_reg dn green">Сохранить</button>
                    <a href="{{route('admin.categories')}}" class="btn_log_reg dn admin3 blue">Назад</a>
                </div>
            </form>
        </div>
    </div>
@endsection