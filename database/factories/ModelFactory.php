<?php

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| Here you may define all of your model factories. Model factories give
| you a convenient way to create models for testing and seeding your
| database. Just tell the factory how a default model should look.
|
*/

/** @var \Illuminate\Database\Eloquent\Factory $factory */
//Location faker data
$factory->define(App\Location::class, function (Faker\Generator $faker) {
    return [
        'location' => $faker->location,
        // 'email' => $faker->email,
        // 'name' => $faker->name
    ];
});
$location = factory(App\Location::class, 10)->create();
 




$factory->define(\Timetabler\Program::class, function (Faker\Generator $faker){
    return [
        "name"=> $faker->sentence(4),
        "semesters"=> rand(2, 3),
        "years"=> rand(2, 4)
    ];
});

$factory->define(\Timetabler\Unit::class, function(Faker\Generator $faker){

    $lec_hours = [30, 45];
    $picked_num = $lec_hours[array_rand($lec_hours)];
    $lab_types = \Timetabler\LabType::all();
    return [
        "code"=> $faker->unique()->text(8),
        "name"=> $faker->sentence(4),
        "lecture_hours"=> $picked_num,
        "lab_hours"=> $picked_num == 45 ? 0 : 30,
        "lab_type_id"=> $picked_num == 45 ? null : $lab_types->random(1)[0]->id
    ];
});

$factory->define(\Timetabler\Room::class, function(Faker\Generator $faker){
    $locations = \Timetabler\Location::all();

    $types = ['lecture', 'lab'];
    $type = $types[array_rand($types)];
    $capacities = [30, 50, 100, 200];
    $capacity = $capacities[array_rand($capacities)];

    $lab_types = \Timetabler\LabType::all();
    return [
        "location_id"=> $locations->random(1)[0]->id,
        "room_code"=> $faker->unique()->word,
        "type"=> $type,
        "capacity"=> $capacity,
        "lab_type_id"=> $type == 'lab'? $lab_types->random(1)[0]->id : null
    ];
});
