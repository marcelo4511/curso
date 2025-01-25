<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link href="{{ mix('css/app.css') }}" rel="stylesheet">
    <script src="{{ mix('/js/app.js') }}" defer></script>
    <link rel="shortcut icon" href="{{ asset('images/favicon.ico') }}?v={{ config('version.app') }}" type="image/x-icon">
    @inertiaHead
</head>

<body>
    @inertia
</body>

</html>