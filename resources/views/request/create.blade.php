@extends('layouts.app')
@permission('request-create')  
    @section('content')

            <div class="row">
                <div class="col-lg-12 margin-tb">
                    <div class="pull-left">
                        <h2>Create New Request</h2>
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

            {!! Form::open(array('route' => 'request.store','method'=>'POST')) !!}
            <div class="row">

                    <div class="col-xs-12 col-sm-12 col-md-12">
                <input type="hidden" placeholder="Name" value="<?php echo Auth::user()->id ; ?>" class="form-control" name="user_id" >
             
            </div>

            <div class="col-xs-12 col-sm-12 col-md-12">
                <div class="form-group">
                    <strong>Book:</strong>
                    
                    <select name='book_id'>
                        <?php foreach($books as $book): ?>
                              <option value='<?php echo $book->id; ?>'><?php echo $book->title;  ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>

            

            <div class="col-xs-12 col-sm-12 col-md-12 text-center">
                                    <button type="submit" class="btn btn-primary">Submit</button>
            </div>

            </div>
            {!! Form::close() !!}

    @endsection
@endpermission