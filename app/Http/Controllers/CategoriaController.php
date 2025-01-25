<?php

namespace App\Http\Controllers;

use App\Models\Categoria;
use Illuminate\Http\Request;
use Inertia\Inertia;

class CategoriaController extends Controller
{
    public function index()
    {
        return Inertia::render('Categoria/Index');
    }

    public function get()
    {
        return Categoria::all();
    }

    public function store(Request $request)
    {
        try {
            $data = $request->all();
            $category = Categoria::create($data);
            return response()->json($category, 201);
        } catch (\Exception $exception) {
            return response()->json('error', 'Falha ao criar categoria: ' . $exception->getMessage());
        }
    }
}
