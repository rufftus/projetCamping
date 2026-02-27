@extends('layouts/master')
@section('content')
    <form method="POST" action="{{ route('validSejour') }}">
        @csrf
    <div class="col-md-6 well well-md">
        <h1>Ajouter Séjour</h1>
        <div class="form-group">
            <label> Numéro Client : </label>
            <select class="form-control" name="cli" required>
                <option value=0>Sélectionner un client</option>
                @foreach ($clients as $cli)
                    <option value="{{ $cli->NumCli }}">{{ $cli->NomCli }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label> Numéro Emplacement : </label>
            <select class="form-control" name="emp" required>
                <option value=0>Sélectionner un emplacement</option>
                @foreach ($emplacements as $emp)
                    <option value="{{ $emp->NumEmpl }}">{{ $emp->NumEmpl }}</option>
                @endforeach
            </select>
        </div>
        <div class="form-group">
            <label> Date de début :</label>
            <input type="date" name="debSej" class="form-control" min="0">
        </div>
        <div class="form-group">
            <label> Date de fin :</label>
            <input type="date" name="finSej" class="form-control" min="0">
        </div>
        <div class="form-group">
            <label">Nombre de personnes :</label>
            <input type="text" class="form-control" name="nbPers" value="">
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-default btn-primary"><span class="glyphicon glyphicon-ok"></span>
                Valider
            </button>
            <button type="button" class="btn btn-default btn-primary"
                    onclick="{ window.location = '/home'; }">
                <span class="glyphicon glyphicon-remove"></span> Annuler
            </button>
        </div>
    </div>
    </form>
@endsection
