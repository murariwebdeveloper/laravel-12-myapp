<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Admin
        User::create([
            'name' => 'Admin',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('12345678'),
            'role' => 1,
            'status' => 1,
        ]);

        User::create([
            'name' => 'Murari Singh',
            'email' => 'user@gmail.com',
            'password' => Hash::make('12345678'),
            'role' => 0,
            'status' => 1,
        ]);

        // 50 more users -> total 52
        User::factory(50)->create();
    }
}
