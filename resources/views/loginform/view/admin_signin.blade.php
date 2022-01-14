@extends('loginform.layout.main')
@section('title')
    Sign in
@endsection
@section('content')
    
    @if (session('errors'))
        @foreach (session('errors')->all() as $key => $message)
            <p class="bg-success rounded" style="padding: 10px;">{{ $message }}</p>
        @endforeach
    @endif

    <div class="main">
    <section class="sign-in">
        <div class="container">
            <div class="signin-content">
                <div class="signin-image">
                    <figure><img src="/login/images/signin-image.jpg" alt="sing up image"></figure>
                    <a href='{{ route('home') }}' class="signup-image-link">Home</a>
                </div>

                <div class="signin-form">
                    <h2 class="form-title">Login to Admin Account</h2>
                    <form method="POST" class="register-form" id="login-form" action="{{ route('auth_admin') }}">
                    	@csrf
                        <div class="form-group">
                            <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                            <input type="text" name="username" id="username" placeholder="Your Username" />
                        </div>
                        <div class="form-group">
                            <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                            <input type="password" name="password" id="password" placeholder="Password" />
                        </div>
                        <div class="form-group">
                            <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                            <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember
                                me</label>
                        </div>
                        <div class="form-group form-button">
                            <input type="submit" name="signin" id="signin" class="form-submit" value="Log in" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</div>

@endsection