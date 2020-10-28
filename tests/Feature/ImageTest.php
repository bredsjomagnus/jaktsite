<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

use App\Image;
use App\User;
use App\Killreport;

class ImageTest extends TestCase
{
    use RefreshDatabase;
    
    /**
     * @test
     *
     * @return void
     */
    public function a_user_can_edit_an_image_to_a_killreport()
    {
        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $this->get('/image/'.$killreport->id.'/edit')->assertOk();
    }

    /**
     * @test
     *
     * @return void
     */
    public function a_guest_cannot_edit_an_image_to_a_killreport()
    {
        $killreport = factory(Killreport::class)->create();

        $this->get('/image/'.$killreport->id.'/edit')->assertRedirect('/login');
    }

    /**
     * @test
     * 
     * @return
     */
    public function a_user_can_create_a_new_image()
    {
        $this->withoutExceptionHandling();

        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $image = factory(Image::class)->make([
            'killreport_id' => $killreport->id,
            'user_id'       => $user->id
        ]);

        // attributen i form av en array
        $image_attributes = $image->getAttributes();

        // antar att användaren kan skapa rad i image
        $this->post('/image/'.$killreport->id.'/store', $image_attributes)->assertOk();

        // antar att image lagrats i databasen
        $this->assertDatabaseHas('images', ['id' => 1]);
    }

    /**
     * @test
     * 
     * @return
     */
    public function a_user_can_delete_own_image()
    {
        $this->withoutExceptionHandling();

        $user = $this->signIn();

        $killreport = factory(Killreport::class)->create();

        $image = factory(Image::class)->create([
            'killreport_id' => $killreport->id,
            'user_id'       => $user->id
        ]);

        // antar att image lagrats i databasen
        $this->assertDatabaseHas('images', ['id' => $image->id]);

        $this->delete('/image/'.$image->id.'/delete')->assertOk();

        $this->assertDatabaseMissing('images', ['id' => $image->id]);
    }

    /**
     * @test
     * 
     * @return
     */
    public function a_user_cannot_delete_another_users_image()
    {
        $this->withoutExceptionHandling();

        $user_id_1 = factory(User::class)->create(['id' => 1]);

        $this->signIn($user_id_1);

        $killreport = factory(Killreport::class)->create();

        $image = factory(Image::class)->create([
            'killreport_id' => $killreport->id,
            'user_id'       => 2
        ]);

        // antar att image lagrats i databasen
        $this->assertDatabaseHas('images', ['id' => $image->id]);

        // antar att det är ok för användaren att nå endpoint
        $this->delete('/image/'.$image->id.'/delete')->assertOk();

        // antar att bilden fortfarande är kvar i databasen
        $this->assertDatabaseHas('images', ['id' => $image->id]);
    }


    /**
     * @test
     * 
     * @return
     */
    public function admin_can_delete_another_users_image()
    {
        $this->withoutExceptionHandling();

        $user_id_1 = factory(User::class)->create(['id' => 1, 'role' => 'admin']);

        $this->signIn($user_id_1);

        $killreport = factory(Killreport::class)->create();

        $image = factory(Image::class)->create([
            'killreport_id' => $killreport->id,
            'user_id'       => 2
        ]);

        // antar att image lagrats i databasen
        $this->assertDatabaseHas('images', ['id' => $image->id]);

        // antar att det är ok för användaren att nå endpoint
        $this->delete('/image/'.$image->id.'/delete')->assertOk();

        // antar att bilden fortfarande är kvar i databasen
        $this->assertDatabaseMissing('images', ['id' => $image->id]);
    }

    /**
     * @test
     * 
     * @return void
     */
    public function a_user_can_update_a_killreport_image()
    {
        $this->withoutExceptionHandling();
        $this->signIn();

        $image = factory(Image::class)->create(['display' => 'no']);

        $this->assertDatabaseHas('images', ['id' => $image->id, 'display' => 'no']);

        $image->display = 'yes';

        $image_attributes = $image->getAttributes();

        // dd($image_attributes);

        $this->patch('/image/'.$image->id.'/update', $image_attributes)->assertOk();

        $this->assertDatabaseHas('images', ['id' => $image->id, 'display' => 'yes']);
        $this->assertDatabaseMissing('images', ['display' => 'no']);
    }
}
