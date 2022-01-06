@extends('admin.layout.master')

@section('title')
    Books
@endsection

@section('content')
	<div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Books</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" cellspacing="0" style="table-layout: auto; width: auto;">
                            <thead>
                                <tr>
									<th scope="col">Id</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Book Name</th>
									<th scope="col">Book Publisher</th>
                                    <th scope="col">Tags</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">In Stock</th>
									<th scope="col">Added at</th>
									<th colspan="1"></th>
								</tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th scope="col">Id</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Book Name</th>
                                    <th scope="col">Book Publisher</th>
                                    <th scope="col">Tags</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">In Stock</th>
                                    <th scope="col">Added at</th>
                                    <th colspan="1"></th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($books as $value)
									<trs>
										<th scope="row">{{$value['id']}}</th>
                                        <td><a href="{{ route('book_details' , $value['id']) }}"><img src="{{ asset($value['image']) }}" width="100"></a></td>
                                        <td>{{$value['book_name']}}</td>
										<td>{{$value['bookstore_name']}}</td>
                                        <td>
                                            <ul>
                                                @foreach ($book_tags[$value['id']] as $key => $tags)
                                                    <li>{{ $tags['tag_name'] }}</li>
                                                @endforeach
                                            </ul>
                                        </td>
                                        <td>{{$value['price']}}</td>
                                        <td>{{$value['quantity']}}</td>
										<td>{{$value['created_at']->toDateString() }}</td>
										<td>
                                            <ul>
                                                <li><a href="{{ Route('admin_book_edit', $value['id']) }}">Edit</a></li>
								                <li><a href="{{ Route('admin_book_delete', $value['id']) }}">Delete</a></li>
                                                <li><a href="{{ Route('admin_book_delete', $value['id']) }}">Comment</a></li>
                                            </ul>
                                        </td>
									</tr>
								@endforeach
                            </tbody>
                        </table>
                    </div>
                    <a href='{{ Route('admin_book_add') }}' class="btn btn-primary">Add book</a>
                </div>
            </div>

            @if (session('success'))
            	<div class="bg-success rounded" style="color: white;">{{ session('success') }}</div>
            @endif

        </div>
@endsection


    <!-- Custom fonts for this template-->
