@extends('admin.base')

@section('main-content')
    <div class="row mb-3">
        <h2 class="col-lg-12">Пользователи</h2>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <table class="table table-hover table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>Номер</th>
                    <th>Имя</th>
                    <th>Действие</th>
                </tr>
                </thead>
                <tbody>
                @foreach($users as $user)
                    <tr id="{{$user->id}}">
                        <td>{{$user->id}}</td>
                        <td>{{$user->name}}</td>
                        <td>

                            {{Form::open(['route'=>['users.destroy', $user->id], 'method'=>'delete'])}}
                            <button onclick="return confirm('Вы уверены?')" type="submit" class="delete_user">
                                Удалить
                            </button>

                            {{Form::close()}}

                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection