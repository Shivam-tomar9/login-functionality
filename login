 
//Controller Code
public function userLogin(Request $request)
    {
        $credentials = $request->only('email', 'password');

      
        if (Auth::attempt($credentials)) {
           
            return redirect()->intended('/');
        }

        // Authentication failed
        return back()->withErrors(['email' => 'Invalid credentials']);
    }
        public function userLogout()
    {
        Auth::logout();

        return redirect('/');
    }
//Navbar blade file code
  @if(auth()->check())
  <!-- User is logged in, show logout -->
  <li class=""><a href="{{ route('logout-user') }}">Logout</a></li>
@else
  <!-- User is not logged in, show login -->
  <li class=""><a href="{{ route('mylogin') }}">Login</a></li>
@endif
