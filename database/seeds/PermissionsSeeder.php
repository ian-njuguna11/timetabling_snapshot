<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;
use Timetabler\Lectures;
use Timetabler\User;

class PermissionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        app()[PermissionRegistrar::class]->forgetCachedPermissions();

        Permission::create(["name" => "view"]);
        Permission::create(["name" => "edit"]);
        Permission::create(["name" => "add-users"]);
        Permission::create(["name" => "delete-users"]);
        Permission::create(["name" => "generate-timetable"]);
        Permission::create(["name" => "assign-lecturers"]);

        $admin_role = Role::create(["name" => "admin"]);
        $admin_role->givePermissionTo(["edit", "view", "add-users", "delete-users"]);

        $timetabler_role = Role::create(["name" => "timetabler"]);
        $timetabler_role->givePermissionTo("view", "edit", "generate-timetable");

        $dean_role = Role::create(["name" => "dean"]);
        $dean_role->givePermissionTo("view", "assign-lecturers");

        $lecturer_role = Role::create(["name" => "lecturer"]);
        $lecturer_role->givePermissionTo("view");

        $hods_role = Role::create(["name" => "hods"]);
        $hods_role->givePermissionTo("view");

        $admin = User::firstOrcreate([
            "name" => "Administrator",
            "email" => "injuguna@kabarak.ac.ke",
            "role" => "1",
            "password" => bcrypt("admin123")
        ]);

        $admin->assignRole($admin_role);

        $timetabler = User::firstOrcreate([
            "name" => "Timetabler",
            "email" => "timetabler@mail.com",
            "role" => "2",
            "password" => bcrypt("timetabler")
        ]);
        $timetabler->assignRole($timetabler_role);
        
        
        $lecturer = User::firstOrcreate([
            "name" => "lecturer",
            "email" => "lecturer@mail.com",
            "role" => "4",
            "password" => bcrypt("lecturer")
        ]);
        
        
        $lecturer->assignRole($timetabler_role);

        $hod = User::firstOrcreate([
            "name" => "hod",
            "email" => "hod@mail.com",
            "role" => "4",
            "password" => bcrypt("lecturer_hod")
        ]);

        \Timetabler\School::Create(['name'=>'SSET']);

        \Timetabler\department::create([
            "name"=>"computer science",
            "school_ID"=>1]);

        Lectures::firstOrCreate([
            "first_name" => "Andrew",
            "last_name" => "Mwaura",
            "email" => "injuguna@kabarak.ac.ke",
            "deparment_ID"=>"1",
            "password" => Hash::make("lecturer_hod"),
        ]);
        
        Lectures::firstOrCreate([
            "first_name" => "Moses",
            "last_name" => "Karanja",
            "email" => "lecturer@mail.com",
            "deparment_ID"=>"1",
            "password" => Hash::make("lecturer"),
        ]);

        $hod->assignRole($timetabler_role);




    }
}
