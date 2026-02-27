<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\UtilisateurService;
use Exception;

class UtilisateurController extends Controller
{
    public function login()
    {
        try {
            return view('authentification.formLogin');
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function auth(Request $request)
    {
        try {
            $login = $request->input('login');
            $pwd = $request->input('pwd');
            $serviceU = new UtilisateurService();
            $connected = $serviceU->signIn($login, $pwd);
            if ($connected) {
                return view('home');
            } else {
                $erreur = "Login ou mot de passe inconnu !";
                return view('authentification.formLogin', compact('erreur'));
            }
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function logout()
    {
        try {
            $serviceU = new UtilisateurService();
            $serviceU->signOut();
            return view('home');
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }
}
