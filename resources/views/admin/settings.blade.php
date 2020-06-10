@extends('admin.base')

@section('main-content')
    <div class="row mb-3">
        <h2 class="col-lg-12 adminh2">Настройки</h2>
    </div>
    <div class="row mb-3">
        <div class="col-lg-12" style="min-height: 1.5rem; color: red">
            {{$message}}
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <form method="POST" action="{{route('admin.settings.send')}}">
                {{csrf_field()}}
                <div class="form-group row">
                    <div class="col-lg-4">
                        <input type="email" name="email" class="myClassi" id="inputEmail"  value="{{$email}}">
                    </div>
                    <div class="col-lg-8">
                        <label for="inputEmail" class="col-form-label">Email для отправки писем о новых заказах</label>
                    </div>
                </div>
                <div class="form-group row">
                    <div class="col-lg-12">
                        <button type="submit" class="btn_log_reg green">Сохранить</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection