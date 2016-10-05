@extends('layouts.app')
@permission('request-edit')
    @section('content')

            <div class="row">
                <div class="col-lg-12 margin-tb">
                    <div class="pull-left">
                        <h2>Edit New Request</h2>
                    </div>
                    <div class="pull-right">
                        <a class="btn btn-primary" href="{{ route('request.index') }}"> Back</a>
                    </div>
                </div>
            </div>

            @if (count($errors) > 0)
                    <div class="alert alert-danger">
                            <strong>Whoops!</strong> There were some problems with your input.<br><br>
                            <ul>
                                    @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                    @endforeach
                            </ul>
                    </div>
            @endif

            {!! Form::model($data, ['method' => 'PATCH','route' => ['request.update', $data->id]]) !!}
            <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>User ID:</strong>
                    {!! Form::text('user_id', null, array('placeholder' => 'User','class' => 'form-control')) !!}
                </div>
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Book ID:</strong>
                    {!! Form::text('book_id', null, array('placeholder' => 'Book','class' => 'form-control')) !!}
                </div>
            </div>

           

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Approved ( Put 0 for "Yes" or 1 for "No" ):</strong>
                    {!! Form::text('approved',null, array('placeholder' => 'Confirm approval. 1 = Yes , 0 = No','class' => 'form-control')) !!}
                </div>
            </div>

            

            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
            </div>

            </div>
            {!! Form::close() !!}


    @endsection
 @endpermission   