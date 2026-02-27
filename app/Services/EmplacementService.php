<?php

namespace App\Services;

use App\Models\Emplacement;
use Illuminate\Database\QueryException;
use App\Exceptions\UserException;

class EmplacementService
{
    public function getListeEmplacements()
    {
        try {
            return Emplacement::all();
        } catch (QueryException $exception) {
            $userMessage = "Impossible d'accéder à la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }
}
