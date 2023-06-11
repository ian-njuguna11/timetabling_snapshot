@extends('layouts.datatable')
@section('Page-Title')
    Upload program Csv
@endsection
@section('content')



    <head>
        {{--    <title>Laravel 8|7 Drag And Drop File/Image Upload Examle </title>--}}

        <link href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/dropzone.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.7.2/min/dropzone.min.js"></script>

        <script>
            var dropzone = new Dropzone('#file-upload', {
                previewTemplate: document.querySelector('#preview-template').innerHTML,
                parallelUploads: 3,
                thumbnailHeight: 150,
                thumbnailWidth: 150,
                maxFilesize: 5,
                filesizeBase: 1500,
                thumbnail: function (file, dataUrl) {
                    if (file.previewElement) {
                        file.previewElement.classList.remove("dz-file-preview");
                        var images = file.previewElement.querySelectorAll("[data-dz-thumbnail]");
                        for (var i = 0; i < images.length; i++) {
                            var thumbnailElement = images[i];
                            thumbnailElement.alt = file.name;
                            thumbnailElement.src = dataUrl;
                        }
                        setTimeout(function () {
                            file.previewElement.classList.add("dz-image-preview");
                        }, 1);
                    }
                }
            });

            var minSteps = 6,
                maxSteps = 60,
                timeBetweenSteps = 100,
                bytesPerStep = 100000;

            dropzone.uploadFiles = function (files) {
                var self = this;

                for (var i = 0; i < files.length; i++) {

                    var file = files[i];
                    totalSteps = Math.round(Math.min(maxSteps, Math.max(minSteps, file.size / bytesPerStep)));

                    for (var step = 0; step < totalSteps; step++) {
                        var duration = timeBetweenSteps * (step + 1);
                        setTimeout(function (file, totalSteps, step) {
                            return function () {
                                file.upload = {
                                    progress: 100 * (step + 1) / totalSteps,
                                    total: file.size,
                                    bytesSent: (step + 1) * file.size / totalSteps
                                };

                                self.emit('uploadprogress', file, file.upload.progress, file.upload
                                    .bytesSent);
                                if (file.upload.progress == 100) {
                                    file.status = Dropzone.SUCCESS;
                                    self.emit("success", file, 'success', null);
                                    self.emit("complete", file);
                                    self.processQueue();
                                }
                            };
                        }(file, totalSteps, step), duration);
                    }
                }
            }

        </script>

        <style>
            .dropzone {
                background: #d7d8e3;
                /*border-radius: 13px;*/
                /*max-width: auto;*/
                /*margin-left: auto;*/
                /*margin-right: auto;*/
                border: 2px dotted #1833FF;
                /*margin-top: 50px;*/
            }

        </style>
    </head>

    <body>
    <div id="dropzone">


            <!-- Main content -->
            <section class="content m-20">
              <div class="container-fluid">
                <div class="row">
                  <!-- left column -->
                  <div class="col-md-6">
                    <!-- jquery validation -->
                    <div class="card ">
                      <div class="card-header  kabarak-card-header">
                      <h5><i class="fas fa-upload"></i>
                          <label for="exampleInputEmail1">Upload programs for {{$data->name}} </label>

                      <!-- <span class="pull-right">Go back to <a href="{{ url('/schools') }}" >Schools </a></span> -->

                        </h5>
                      </div>
                        <form action="{{ route('dropzoneFileUpload') }}" class="dropzone" id="file-upload"
                              enctype="multipart/form-data">
                            @csrf
{{--                            <div class="dz-message">--}}
                                Drag and Drop Single/Multiple Files Here<br>
{{--                            </div>--}}


                        </form>
                    </div>
                    <!-- /.card -->
{{--                    </div>--}}
                  <!--/.col (left) -->
                  <!--/.col (right) -->
                </div>
                <!-- /.row -->
              </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
    </div>
    </body>

    </html>

@endsection
