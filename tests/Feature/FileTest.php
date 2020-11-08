<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;

class FileTest extends TestCase
{
    /**
     * @test
     *
     * @return void
     */
    public function file_example_test()
    {
        // Storage::fake('local');
        $this->withoutExceptionHandling();

        $image = UploadedFile::fake()->image('photo1.jpg');

        // dd($image);

        $response = $this->post('/file/store', [
            'image' => $image
        ]);

        // dd($response);

        // Assert one or more files were stored...
        // Storage::disk('local')->assertExists('photo1.jpg');

        // Assert one or more files were not stored...
        Storage::disk('local')->assertMissing('missing.jpg');
    }
}
