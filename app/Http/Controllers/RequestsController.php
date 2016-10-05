<?php

namespace App\Http\Controllers;
use App\Requests;
use App\Book;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Auth;
use DB;
class RequestsController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {

      $reader_role_id = DB::table('roles')->select('roles.id')->where('name','reader')->get();
     
      if(!empty($reader_role_id)){
          $reader_role_id = $reader_role_id[0]->id;
      }else{
          $reader_role_id = false;
      }
     
      #get user role id
      $user_role_id = DB::table('role_user')->select('role_user.role_id')->where('role_user.user_id',Auth::user()->id)->get();
     if(!empty($user_role_id)){
          $user_role_id = $user_role_id[0]->role_id;
      }else{
          $user_role_id = '';
      }
      
      #if I am a reader
      if($user_role_id == $reader_role_id){
          #then 
          $data = DB::table('requests')
            ->join('books', 'books.id', '=', 'requests.book_id')
            ->join('users', 'users.id', '=', 'requests.user_id')
            ->select('requests.*', 'users.name', 'books.title')
            ->where('requests.user_id',Auth::user()->id)
            ->get();
      }else{
          #my role is admin or librarian
          $data = DB::table('requests')
            ->join('books', 'books.id', '=', 'requests.book_id')
            ->join('users', 'users.id', '=', 'requests.user_id')
            ->select('requests.*', 'users.name', 'books.title')
            ->get();
      }
      
        
    
        return view('Request.index',compact('data'))
            ->with('i', ($request->input('page', 1) - 1) * 5);
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
        $books =DB::table('books')
                ->select('books.*')
                ->get();
        
        return view('Request.create',compact('books'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'book_id' => 'required',
            'user_id' => 'required',
        ]);
        
        Requests::create($request->all());

        return redirect()->route('request.index')
                        ->with('success','Request created successfully');
    }



    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $data = Requests::find($id);
       
        return view('Request.edit',compact('data'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'book_id' => 'required',
            'approved' => 'required'
        ]);

        Requests::find($id)->update($request->all());

        return redirect()->route('request.index')
                        ->with('success','The request was updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Requests::find($id)->delete();
        return redirect()->route('request.index')
                        ->with('success','Request deleted successfully');
    }
}