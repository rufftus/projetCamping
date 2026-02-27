@extends('layouts/master')
@section('content')
<h1>Liste Séjours</h1>
<div class="well">
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Numéro Séjour</th>
                <th>Nom Client</th>
                <th>Numéro Emplacement</th>
                <th>Date début</th>
                <th>Date de fin</th>
                <th>Nombre de personnes</th>
                <th>Modification</th>
                <th>Supprimer</th>
            </tr>
        </thead>
        @foreach($sejours as $sej)
        <tr>
            <td>{{$sej->NumSej}}</td>
            <td><b>{{$sej->NomCli}}</b></td>
            <td>{{$sej->NumEmpl}}</td>
            <td>{{date('d/m/Y', strtotime($sej->DateDebSej))}} </td>
            <td>{{date('d/m/Y', strtotime($sej->DateFinSej))}}</td>
            <td>{{$sej->NbPersonnes}}</td>
            <td style="text-align:center;"><a href="{{ url('/editerSejour/'.$sej->NumSej) }}">
                    <span class="glyphicon glyphicon-pencil" data-toggle="tooltip" data-placement="top" title="modifier"></span></a>
            </td>
            <td style="text-align:center;">
                     <a class="glyphicon glyphicon-remove-sign" data-toggle="tooltip" data-placement="top" title="Supprimer" href="#"
                       onclick="if (confirm('Suppression confirmée ?')) window.location ='{{ route('removeSejour',$sej->NumSej) }}';">
                    </a>
            </td>
        </tr>
        @endforeach
    </table>
    <div class="espace">
        <div class="col-md-12"></div>
    </div>
    <div class="form-group">
        <div class="col-md-12 col-md-offset-11">
            <a class="btn btn-default btn-primary"   href="{{ url('/') }}">
                <span class="glyphicon glyphicon-arrow-left"></span> Retour</a>
        </div>
    </div>
</div>

@stop
