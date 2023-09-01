<div class="col-md-10">
    <h4>{{$roomName}}</h4>
    @foreach($room as $day => $roomSessions)
        <h5>{{$day}}</h5>
        <table class="table">
            <thead>
                <tr>
                    <th>Time</th>
                    <th>Unit</th>
                    <th>Group</th>
                    <th>No. of students</th>
                    <th>Program</th>
                </tr>
            </thead>
            <tbody>
                @foreach($roomSessions as $session)
                    <tr>
                        <td>{{$session->time}}</td>
                        <td>{{$session->unit}} {{$session->type == 'lab' ? "(practical)" : "" }}</td>
                        <td>{{$session->group}}</td>
                        {{--<td>{{$session->totalStudents}}</td>--}}
                        <td>{{$session->studentsPerGroup}}</td>
                        <td>{{$session->programs}}</td>
                    </tr>   
                @endforeach
            </tbody>
        </table>
        <div class="next-page"></div>
    @endforeach
</div>