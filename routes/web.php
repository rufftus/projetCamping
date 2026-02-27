<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UtilisateurController;
use App\Http\Controllers\SejourController;

Route::get('/', function () {
    return view('home');
});

Route::get('/home', function () {
    return view('home');
});

/* * *********************************************************************** */
/* * ******  Authentification ********************************************** */
/* * *********************************************************************** */

Route::get('/getLogin', function () {
    return view('authentification/formLogin');
});

Route::post('/postLogin', [UtilisateurController::class, 'auth'])->name('auth');

Route::get('/getLogout', [UtilisateurController::class, 'logout'])->name('logout');

/* * *********************************************************************** */
/* * ******  Sejour ******************************************************** */
/* * *********************************************************************** */


Route::get('/listerSejours', [SejourController::class, 'listSejours']);

/*
 * Ajout Séjour
 */
Route::get('/afficher', [SejourController::class, 'affSejour'])->name('affSejour');
Route::post('/afficher', [SejourController::class, 'rechSejour'])->name('rechSejour');

//get ajout
Route::get('/ajouterSejour', [SejourController::class, 'addSejour']);

// post ajout
Route::post('/ajouterSejour', [
    'uses' => 'App\Http\Controllers\SejourController@validSejour',
    'as' => 'validSejour'
]);

Route::get('/editerSejour/{id}', [SejourController::class, 'editSejour']);

//post modif
Route::post('/modifierSejour',
    [
        'uses' => 'App\Http\Controllers\SejourController@updateSejour',
        'as' => 'updateSejour'
    ]);

// suppression
Route::get('/supprimerSejour/{id}', [SejourController::class, 'removeSejour'])->name('removeSejour');

