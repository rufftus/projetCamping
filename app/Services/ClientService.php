<?php

namespace App\Services;

use App\Models\Client;
use Illuminate\Database\QueryException;
use App\Exceptions\UserException;

class ClientService
{
    public function getListeClients()
    {
        try {
            return Client::all();
        } catch (QueryException $exception) {
            $userMessage = "Impossible d'accéder à la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
    }
}
