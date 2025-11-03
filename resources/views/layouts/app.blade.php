<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>@yield('title','ProductApp')</title>
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.22.1/dist/bootstrap-table.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-table@1.21.2/dist/extensions/reorder-rows/bootstrap-table-reorder-rows.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.1/extensions/fixed-columns/bootstrap-table-fixed-columns.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    @stack('styles')
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="{{ route('dashboard') }}">Product Order App</a>
        <div>
            @auth
                <a href="{{ route('products.index') }}" class="btn btn-sm btn-outline-light me-2">Products</a>

                @if(auth()->user()->isAdmin())
                    <a href="{{ route('users.index') }}" class="btn btn-sm btn-outline-light me-2">Users</a>
                @endif

                <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-inline">
                    @csrf
                    <button type="button" class="btn btn-outline-light btn-sm" onclick="confirmLogout()">Logout</button>
                </form>
            @endauth
        </div>
    </div>
</nav>

<div class="container my-4">
    @yield('content')
</div>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>



<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/bootstrap-table.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/extensions/export/bootstrap-table-export.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/extensions/mobile/bootstrap-table-mobile.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/extensions/resizable/bootstrap-table-resizable.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.18.1/extensions/fixed-columns/bootstrap-table-fixed-columns.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.18.1/dist/extensions/cookie/bootstrap-table-cookie.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/tablednd@1.0.5/dist/jquery.tablednd.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.18.0/dist/extensions/reorder-rows/bootstrap-table-reorder-rows.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/extensions/print/bootstrap-table-print.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-table@1.23.2/dist/extensions/page-jump-to/bootstrap-table-page-jump-to.min.js"></script>

<script>
    function confirmLogout() {
        if (confirm('Are you sure you want to logout?')) {
            document.getElementById('logout-form').submit();
        }
    }
</script>
@stack('scripts')
</body>
</html>
