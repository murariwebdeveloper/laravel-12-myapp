@extends('layouts.app')
@section('title','Register')
@section('content')
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header bg-transparent">
                    <h3>Register</h3>
                </div>
                <div class="card-body">
                    <form method="POST" action="{{ route('register.submit') }}">
                        @csrf
                        @if($errors->any())
                            <div class="alert alert-danger">{{ $errors->first() }}</div>
                        @endif
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control form-control-sm" value="{{ old('name') }}"
                                   placeholder="Name" required oninvalid="this.setCustomValidity('The name field is required.')" oninput="setCustomValidity('')">
                        </div>
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
                        <div class="mb-3">
                            <label>Confirm Password</label>
                            <input type="password" name="password_confirmation" class="form-control form-control-sm"
                                   placeholder="Confirm Password" required oninvalid="this.setCustomValidity('The confirm password field is required.')" oninput="setCustomValidity('')">
                        </div>
                        <button class="btn btn-sm btn-success w-100">Register</button>
                    </form>
                </div>
                <div class="card-footer bg-transparent">
                    <p class="mt-2"><a href="{{ route('login') }}">Login with registered user</a></p>
                </div>
            </div>
        </div>
    </div>
@endsection
