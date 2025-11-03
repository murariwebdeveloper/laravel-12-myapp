@extends('layouts.app')
@section('title','Login')
@section('content')
    <div class="row justify-content-center align-middle">
        <div class="col-md-4 justify-content-center align-middle">
            <div class="card">
                <div class="card-header bg-transparent">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('login.submit') }}">
                        @csrf
                        @if($errors->any())
                            <div class="alert alert-danger">{{ $errors->first() }}</div>
                        @endif
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control form-control-sm" value="{{ old('email') }}"
                                   placeholder="Email" required oninvalid="this.setCustomValidity('The email field is required.')" oninput="setCustomValidity('')">
                        </div>
                        <div class="mb-3">
                            <label>Password</label>
                            <input type="password" name="password" class="form-control form-control-sm"
                                   placeholder="Password" required oninvalid="this.setCustomValidity('The password field is required.')" oninput="setCustomValidity('')">
                        </div>
                        <button class="btn btn-sm btn-primary w-100">Login</button>
                    </form>
                </div>
                <div class="card-footer bg-transparent">
                    <p class="mt-2"><a href="{{ route('register') }}">Register as new user</a></p>
                </div>
                <div class="card-footer bg-transparent">
                    <p class="m-0">Admin Login</p>
                    <p class="m-0">Email :- admin@gmail.com</p>
                    <p class="m-0">Password :- 12345678</p>
                </div>
                <div class="card-footer bg-transparent">
                    <p class="m-0">User Login</p>
                    <p class="m-0">Email :- user@gmail.com</p>
                    <p class="m-0">Password :- 12345678</p>
                </div>
            </div>
        </div>
    </div>
@endsection
