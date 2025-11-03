<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\StoreProductRequest;
use App\Http\Requests\UpdateProductRequest;
use App\Models\Product;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    public function index(Request $request)
    {
        $limit = request('limit', 10);
        $offset = request('offset',0);

        $user = $request->user();

        $query = Product::with('user')->latest();

        if (!$user->isAdmin()) $query->where('user_id', $user->id);


        // Apply search filters
        if ($request->has('search')) {
            $search = $request->input('search', null);
            $query->where(function ($query) use ($search) {
                $query->where('name', 'like', '%'.$search.'%')
                    ->orWhere('description', 'like', '%'.$search.'%');
            });
        }


        // Apply sorting
        if ($request->has('sort')) {
            $sortColumn = request('sort', 'id');
            $sortDirection = request('order', 'desc');
            $query->orderBy($sortColumn, $sortDirection);
        }

        // Get the total count for pagination
        $total = $query->count();

        $results = $query->skip($offset)->take($limit)->get();

        $data = ['total' => $total, 'data' => $results ];

        return response()->json($data);
    }

    public function store(StoreProductRequest $request)
    {
        $data = $request->validated();
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('products','public');
        }
        $data['user_id'] = $request->user()->id;
        $product = Product::create($data);
        return response()->json($product, 201);
    }

    public function show(Request $request, Product $product)
    {
        $user = $request->user();
        if (!$user->isAdmin() && $product->user_id !== $user->id) {
            return response()->json(['message'=>'Forbidden'], 403);
        }
        return response()->json($product);
    }

    public function update(UpdateProductRequest $request, Product $product)
    {
        $user = $request->user();
        if (!$user->isAdmin() && $product->user_id !== $user->id) {
            return response()->json(['message'=>'Forbidden'], 403);
        }
        $data = $request->validated();
        if ($request->hasFile('image')) {
            if ($product->image) Storage::disk('public')->delete($product->image);
            $data['image'] = $request->file('image')->store('products','public');
        }
        $product->update($data);
        return response()->json($product);
    }

    public function destroy(Request $request, Product $product)
    {
        $user = $request->user();
        if (!$user->isAdmin() && $product->user_id !== $user->id) {
            return response()->json(['message'=>'Forbidden'], 403);
        }
        if ($product->image) Storage::disk('public')->delete($product->image);
        $product->delete();
        return response()->json(['message'=>'Deleted']);
    }

}
