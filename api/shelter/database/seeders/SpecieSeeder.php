<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SpecieSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Models\Specie::factory(2)->create();
    }
}
