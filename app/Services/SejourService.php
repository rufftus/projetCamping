<?php

namespace App\Services;

use App\Models\Sejour;
use Illuminate\Database\QueryException;
use App\Exceptions\UserException;

class SejourService
{
    public function getById($id)
    {
        try {
            return Sejour::query()->find($id);
        } catch (QueryException $exception) {
            $userMessage = "Impossible d'accéder à la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }

    public function getListeSejours()
    {
        try {
            $sejours = Sejour::query()
                ->select('NumSej', 'NomCli', 'NumEmpl', 'DatedebSej', 'DateFinSej', 'NbPersonnes')
                ->join('client', 'sejour.NumCli', '=', 'Client.NumCli')
                ->get();
            return $sejours;
        } catch (QueryException $exception) {
            $userMessage = "Impossible d'accéder à la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }

    public function saveSejour(Sejour $sejour)
    {
        try {
            $sejour->save();
        } catch (QueryException $exception) {
            $userMessage = "Impossible de mettre à jour la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }

    public function deleteSejour($id)
    {
        try {
            $sejour=Sejour::query()->find($id);
            $sejour->delete();
        } catch (QueryException $exception) {
            $userMessage = "Impossible de mettre à jour la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }

}
