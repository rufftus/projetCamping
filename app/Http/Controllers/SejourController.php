<?php

namespace App\Http\Controllers;

use App\Exceptions\UserException;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use App\Services\SejourService;
use App\Services\ClientService;
use App\Services\EmplacementService;
use App\Models\Sejour;
use Exception;

class SejourController extends Controller
{
    public function listSejours()
    {
        try {
            $service = new SejourService();
            $sejours = $service->getListeSejours();
            return view('sejour.listerSejours', compact('sejours'));
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function addSejour()
    {
        try {
            if (Session::get('role') == "admin") {
                $serviceC = new ClientService();
                $clients = $serviceC->getListeClients();
                $serviceE = new EmplacementService();
                $emplacements = $serviceE->getListeEmplacements();
                return view('sejour.ajouterSejour',
                    compact('clients', 'emplacements'));
            } else {
                throw new UserException("Vous n'avez pas l'autorisation d'ajouter.");
            }
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function validSejour(Request $request)
    {
        try {
            $sejour = new Sejour();
            $sejour->NumCli = $request->input('cli');
            $sejour->NumEmpl = $request->input('emp');
            $sejour->DateDebSej = $request->input('debSej');
            $sejour->DateFinSej = $request->input('finSej');
            $sejour->NbPersonnes = $request->input('nbPers');
            $service = new SejourService();
            $service->saveSejour($sejour);
            return view('home');
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function editSejour($id)
    {
        try {
            $service = new SejourService();
            $sejour = $service->getById($id);

            $serviceC = new ClientService();
            $clients = $serviceC->getListeClients();
            $serviceE = new EmplacementService();
            $emplacements = $serviceE->getListeEmplacements();

            return view('sejour.modifierSejour', compact('sejour', 'clients', 'emplacements'));
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function updateSejour(Request $request)
    {
        try {
            $id = $request->input('id');
            $service = new SejourService();
            $sejour = $service->getById($id);
            $sejour->NumEmpl = $request->input('emp');
            $sejour->DateDebSej = $request->input('debSej');
            $sejour->DateFinSej = $request->input('finSej');
            $sejour->NbPersonnes = $request->input('nbPers');

            $service->saveSejour($sejour);
            return view('home');
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

    public function removeSejour($id)
    {
        try {
            $unSejour = new SejourService();
            $unSejour->deleteSejour($id);
            return view('home');
        } catch (Exception $exception) {
            return view('error', compact('exception'));
        }
    }

}
