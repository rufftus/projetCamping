<?php
/**
 * Created by PhpStorm.
 * User: christian
 * Date: 01/10/2019
 * Time: 13:47
 */

namespace App\Services;

use Illuminate\Support\Facades\Session;
use App\Models\Utilisateur;
use Illuminate\Database\QueryException;
use App\Exceptions\UserException;

class UtilisateurService
{
    public function signIn($login, $pwd) {
        $connected = false;
        try {
            $utilisateur = Utilisateur::query()
                ->where('NomUtil', '=', $login)
                ->first();
            if ($utilisateur) {
                if ($utilisateur->MotPasse == $pwd) {
                    Session::put('id', $utilisateur->NumUtil);
                    Session::put('role', $utilisateur->role);
                    $connected = true;
                }
            }
        }
        catch (QueryException $exception) {
            $userMessage = "Impossible d'accéder à la base de données.";
            throw new UserException($userMessage, $exception->getMessage(), $exception->getCode());
        }
        return $connected;
    }

    public function signOut(){
        Session::put('id', 0);
        Session::put('role', 0);
    }
}
