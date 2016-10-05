@extends('layouts.app')

@permission('request-list') 
    @section('content')

            <div class="row">
                <div class="col-lg-12 margin-tb">
                    <div class="pull-left">
                        <h2>All requests</h2>
                    </div>
                    <div class="pull-right">
                        <a class="btn btn-success" href="{{ route('request.create') }}"> Create New Request</a>
                    </div>
                </div>
            </div>

            @if ($message = Session::get('success'))
                    <div class="alert alert-success">
                            <p>{{ $message }}</p>
                    </div>
            @endif

            <table class="table table-bordered">
                    <tr>
                            <th>No</th>
                            <th>User</th>
                            <th>Book</th>
                            <th>Approved</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th width="280px">Action</th>
                    </tr>
            @foreach ($data as $key => $req)
            <tr>
                    <td>{{ $req->id }}</td>
                    <td>{{ $req->name }}</td>
                    <td>{{ $req->title }}</td>
                    
                    @if($req->approved == 1)
                        <td>Yes</td>
                    @else
                        <td>No</td>
                    @endif
                    <td>{{ $req->created_at}}</td>
                    <td>{{ $req->updated_at }}</td>
                    <td>
                        @permission('request-edit')     
                            <a class="btn btn-primary" href="{{ route('request.edit',$req->id) }}">Edit</a>
                        @endpermission
                        @permission('request-delete') 
                                {!! Form::open(['method' => 'DELETE','route' => ['request.destroy', $req->id],'style'=>'display:inline']) !!}
                                {!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
                        {!! Form::close() !!}
                    @endpermission
                    </td>
            </tr>
            @endforeach
            </table>

           

    @endsection
@endpermission