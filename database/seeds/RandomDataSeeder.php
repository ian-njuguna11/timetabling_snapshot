<?php

use Illuminate\Database\Seeder;
use Timetabler\Location;

class RandomDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker\Factory::create();

        for($i = 0; $i < 10; $i++) {
            Location ::create([
                'location' => $faker->location
            ]);
        }


    }
}
