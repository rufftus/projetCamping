@extends('layouts.master')

@section('content')
    <div class="alert alert-danger" role="alert">
        <p>Oups, il semble que nous avons un problème !</p>
        @if (is_a($exception,"\App\Exceptions\UserException"))
            <p><b>{{ $exception->getUserMessage() }}</b></p>
        @endif
        <p>Veuillez réessayer ou contacter un responsable si le problème persiste...</p>
        @if (env('APP_DEBUG') && isset($exception))
            <hr>
            <p><b>Type : </b>{{ get_class($exception) }} </p>
            <p><b>Message : </b>{{ $exception->getMessage() }} </p>
            <p><b>Code : </b>{{ $exception->getCode() }} </p>
            <p><b>File : </b>{{ $exception->getFile() }} </p>
            <p><b>Line : </b>{{ $exception->getLine() }} </p>
        @endif
    </div>
@endsection
