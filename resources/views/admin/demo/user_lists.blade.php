@extends('admin.layout.master')

@section('title')
    Category
@endsection

@section('content')
	<div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Users</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
									<th scope="col">Id</th>
									<th scope="col">Name</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Phonenumber</th>
									<th scope="col">Email</th>
									<th scope="col">Created at</th>
									<th colspan="2"></th>
								</tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th scope="col">Id</th>
									<th scope="col">Name</th>
                                    <th scope="col">Username</th>
                                    <th scope="col">Phonenumber</th>
									<th scope="col">Email</th>
									<th scope="col">Created at</th>
									<th colspan="2"></th>
                                </tr>
                            </tfoot>
                            <tbody>
                                @foreach ($users as $value)
                                	@if ($value['is_admin'] != '2')
										<tr>
											<th scope="row">{{$value['id']}}</th>
											<td>{{$value['name']}}</td>
                                            <td>{{$value['username']}}</td>
                                            <td>{{$value['phone']}}</td>
											<td>{{$value['email']}}</td>
											<td>{{$value['created_at']->toDateString() }}</td>
											<td>
                                                <ul>
                                                    <li><a href="{{ Route('admin_user_delete', $value['id'] ) }}">Delete</a></li>
                                                    <li><a href="{{ Route('admin_order_lists', $value['id'] ) }}">Orders</a></li>
                                                    <li><a href="{{ Route('admin_comment_lists' , ['user_id' => $value['id']]) }}">Comments</a></li>
                                                </ul>
                                            </td>
										</tr>
									@endif
								@endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            @if (session('success'))
            	<div class="bg-success rounded" style="color: white;">{{ session('success') }}</div>
            @endif

        </div>
@endsection


    <!-- Custom fonts for this template-->
