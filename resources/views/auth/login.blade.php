@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card myClassStyle">
                <div class="card-header">{{ __('Вход') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('login') }}" aria-label="{{ __('Login') }}">
                        @csrf

                        <div class="form-group row">
                            {{-- <label for="email" class="">{{ __('E-mail') }}</label> --}}

                                <input id="email" type="email" class="myClassi{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>
                                <span class="myq" data-placeholder="E-mail"></span>

                                @if ($errors->has('email'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                        </div>

                        <div class="form-group row">
                            {{-- <label for="password" class="">{{ __('Пароль') }}</label> --}}

                                <input id="password" type="password" class="myClassi p{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                                 <span class="myq p" data-placeholder="Пароль"></span>

                                @if ($errors->has('password'))
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $errors->first('password') }}</strong>
                                    </span>
                                @endif
                        </div>

                        <div class="form-group row">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" name="remember" class="za" {{ old('remember') ? 'checked' : '' }}> {{ __('Запомнить меня') }}
                                    </label>
                                </div>
                        </div>

                        <div class="form-group row mb-0">
                                <button type="submit" class="btn_log_reg">
                                    {{ __('Войти') }}
                                </button>

                                <a class="btn_za_pa" href="{{ route('password.request') }}">
                                    {{ __('Забыли пароль?') }}
                                </a>
                        </div>
                    </form>
                    
            </div>
        </div>
    </div>
</div>
@endsection
