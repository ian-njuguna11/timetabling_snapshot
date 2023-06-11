            
            
<style>
.container {
  position: absolute;
  top: 0; right: 0; bottom: 0; left: 0;
  height: 40px;
  margin: auto;
  text-align: center;
}

/** Switch
 -------------------------------------*/

.switch input {
  position: absolute;
  opacity: 0;
}

/**
 * 1. Adjust this to size
 */

.switch {
  display: inline-block;
  font-size: 20px; /* 1 */
  height: 1em;
  width: 2em;
  background: maroon;
  border-radius: 1em;
}

.switch div {
  height: 1em;
  width: 1em;
  border-radius: 1em;
  background: #FFF;
  box-shadow: 0 0.1em 0.3em rgba(0,0,0,0.3);
  -webkit-transition: all 300ms;
     -moz-transition: all 300ms;
          transition: all 300ms;
}

.switch input:checked + div {
  -webkit-transform: translate3d(100%, 0, 0);
     -moz-transform: translate3d(100%, 0, 0);
          transform: translate3d(100%, 0, 0);
}



            </style>
            <!-- Modal -->            
            <div class="modal fade" id="settingsModal" role="dialog">
                <div class="modal-dialog">
          
                  <!-- Modal content-->
                <form enctype="multipart/form-data" action="/profile" method="POST">
                  
                  <div class="modal-content">
                    <div class="modal-header" style="background-color: maroon">
                      <h4 style="color: white" >Check where neccessary To  Send Email With Timetable. </h4>                
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="d-flex flex-row">
                            <div class="p-2  flex-fill">
                                Respective HODs.
                            </div> 
                            <div class="p-2  flex-fill" >
                                <label class="switch"><input type="checkbox" />    <div></div>
                                </label>
                            </div>      
                        </div>   
                        
                        <div class="d-flex flex-row">
                            <div class="p-2  flex-fill">
                                Respective Lecturers.
                            </div> 
                            <div class="p-2  flex-fill" >
                                <label class="switch"><input type="checkbox" />    <div></div>
                                </label>
                            </div>      
                        </div>
                        
                        <div class="d-flex">
                            <div class="p-2 flex-fill">
                                Respective Students.
                            </div> 
                            <div  class="p-2  flex-fill" >
                                <label class="switch"><input type="checkbox" />    <div></div>
                                </label>
                            </div>      
                        </div>
                    </div>
                  </div>
                </form>
                  
                </div>
              </div>