<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
        $user = $request->user();
        if (!$user->isAdmin()) {
            return response()->json(['message'=>'Unauthorized'], 403);
        }

        $limit = request('limit', 10);
        $offset = request('offset',0);

        $query = User::latest();

        $query->whereNot('role', 1);


        if ($request->has('search')) {
            $search = $request->input('search', null);
            $query->where(function ($query) use ($search) {
                $query->where('name', 'like', '%'.$search.'%')
                    ->orWhere('email', 'like', '%'.$search.'%');
            });
        }

        if ($request->has('sort')) {
            $sortColumn = request('sort', 'id');
            $sortDirection = request('order', 'desc');
            $query->orderBy($sortColumn, $sortDirection);
        }

        $total = $query->count();

        $results = $query->skip($offset)->take($limit)->get();

        $data = ['total' => $total, 'data' => $results ];

        return response()->json($data);
    }

    public function show(Request $request, $id)
    {
        $authUser  = $request->user();
        if (!$authUser->isAdmin()) {
            return response()->json(['message'=>'Unauthorized'], 403);
        }
        $user = User::findOrFail($id);

        return response()->json($user);
    }

    public function update(Request $request, $id)
    {
        $authUser  = $request->user();
        if (!$authUser->isAdmin()) {
            return response()->json(['message'=>'Unauthorized'], 403);
        }

        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email',
            'status' => 'required|in:0,1,2,3',
        ]);

        $user = User::findOrFail($id);
        $user->update($request->only(['name', 'email', 'status']));

        return response()->json(['message' => 'User updated successfully', 'user' => $user]);
    }

    public function changeStatus(Request $request, $id)
    {
        $authUser  = $request->user();
        if (!$authUser->isAdmin()) {
            return response()->json(['message'=>'Unauthorized'], 403);
        }

        $request->validate([
            'status' => 'required|in:0,1,2,3',
        ]);

        $user = User::findOrFail($id);
        $user->update(['status' => $request->status]);

        return response()->json(['message' => 'User status updated successfully']);
    }

    public function destroy(Request $request, $id)
    {
        $authUser  = $request->user();
        if (!$authUser->isAdmin()) {
            return response()->json(['message'=>'Unauthorized'], 403);
        }

        $user = User::findOrFail($id);
        $user->delete();

        return response()->json(['message' => 'User deleted successfully']);
    }

}
