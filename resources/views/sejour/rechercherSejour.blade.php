@extends('layouts/master')
@section('content')
    <h2>Rechercher un séjour</h2>
    <form action="{{ route('rechSejour') }}" method="POST">
        @csrf
        <label for="texte">Nom du client</label>
        <input type="text" id="texte" name="texte" required>
        <br><br>
        <button type="submit">Valider</button>
    </form>



@endsection
