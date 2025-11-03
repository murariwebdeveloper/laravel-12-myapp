<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index(Request $request)
    {
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

    public function destroy(Request $request, User $myUser)
    {
        $user = $request->user();
        if (!$user->isAdmin()) {
            return response()->json(['message'=>'Forbidden'], 403);
        }

        $myUser->delete();
        return response()->json(['message'=>'Deleted']);
    }

}
