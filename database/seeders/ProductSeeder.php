<?php

namespace Database\Seeders;

use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        if ($users->isEmpty()) {
            $this->command->info('No users found; skipping products seeding.');
            return;
        }

        Product::factory(200)->make()->each(function ($product) use ($users) {
            $product->user_id = $users->random()->id;
            $product->save();
        });
    }
}
