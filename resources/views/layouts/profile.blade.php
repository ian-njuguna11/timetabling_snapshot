            <!-- Modal -->
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
          
                  <!-- Modal content-->
                <form enctype="multipart/form-data" action="/profile" method="POST">
                  
                  <div class="modal-content">
                    <div class="modal-header" style="background-color: maroon">
                      <h4 style="color: white" >Update {{ Auth::user()->name }}'s profile </h4>                
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">                
                        <img src="/uploads/{{ Auth::user()->avatar }}" alt="" style="width: 150px; height: 150px; border-radius: 50%; margin-right: 25px">
                            @csrf
                            {{-- <label for="">Update Profile</label> --}}
                            <input  type="file"  name="avatar">
                            
                            <div class="form-group">
                                <label for="exampleInputEmail1"> Full Names </label>
                                <input  name="fullName" value="{{ Auth::user()->name }}" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="" placeholder="Enter full names">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your name with anyone else.</small>
                              </div>
                              
                              <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input  name="email" value="{{ Auth::user()->email }}" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                              </div>
                              
                              {{-- <div class="form-group">
                                <label for="exampleInputPassword1">Password</label>
                                <input value="" type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                              </div> --}}
                            
                            
                            
                    </div>
                    <div class="modal-footer" style="background-color: maroon">
                      <button type="submit" class="pull-right btn btn-sm btn-kabarak">Submit</button>
                    </div>
                  </div>
                </form>
                  
                </div>
              </div>