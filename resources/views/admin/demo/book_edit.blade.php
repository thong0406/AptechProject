@extends('admin.layout.master')

@section('title')
    Category
@endsection

@section('content')
	<div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Books</h1>

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <form action="{{ route('admin_book_update' , $book[0]['id']) }}" method="POST">
                        @csrf
                        {{ method_field('PUT') }}
                        <div class="form-group">
                            <label>Book name</label>
                            <input class="form-control" name="book_name" placeholder="Please enter book's name" value="{{ $book[0]['book_name'] }}" />
                        </div>
                        <div class="form-group">
                            <label>Author name</label>
                            <input class="form-control" name="author" placeholder="Please enter book's name" value="{{ $book[0]['author'] }}" />
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input class="form-control" name="image" placeholder="Please enter book's name" value="{{ $book[0]['image'] }}" />
                        </div>
                        <div class="form-group">
                            <label>Quantity</label>
                            <input class="form-control" name="quantity" type="number" placeholder="Please enter book's name" value="{{ $book[0]['quantity'] }}" />
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input class="form-control" name="price" type="number" placeholder="Please enter book's name" value="{{ $book[0]['price'] }}" />
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="description" rows="3" placeholder="Please enter book description" value="{{ $book[0]['description'] }}"></textarea>
                        </div>
                        <div class="form-group">
                            <label>Bookstore</label>
                            <select class="form-select" name="bookstore_id" aria-label="Default select example">
                                <option value="-1" selected></option>
                                @foreach ($bookstores as $key => $value)
                                    <option value=" {{ $value['id'] }} ">{{ $value['bookstore_name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="form-group">
                            <label>
                                Tags
                                <a href="#/" onclick="add_tag()"><i class="fas fa-plus"></i></a>
                            </label>
                            <h6 id="total">1/5</h6>
                            <select class="form-select" name="tag_id[1]" aria-label="Default select example">
                                <option value="-1" selected></option>
                                @foreach ($tags as $key => $value)
                                    <option value=" {{ $value['id'] }} ">{{ $value['tag_name'] }}</option>
                                @endforeach
                            </select>
                            <div id="extra_tags">
                                
                            </div>
                        </div>
                        <button type="submit" class="btn btn-primary">Update</button>
                    </form>
                </div>
            </div>

            @if ($errors->any())
                @foreach($errors->all() as $message) 
                   <div class="bg-danger rounded" style="padding: 5px; color: white; margin-bottom: 5px;">{{ $message }}</div>
                @endforeach
            @endif

        </div>
        <!-- /.container-fluid -->

            
    <!-- End of Main Content -->
@endsection

@push ('scripts')
    <script type="text/javascript">
        var tags = document.getElementById('extra_tags');
        var total = document.getElementById('total');
        var cur_tag = 1;

        function add_tag () {
            if (cur_tag < 5) {
                cur_tag += 1;
                tags.innerHTML += "<br><select class='form-select' name='tag_id[" + parseInt(cur_tag) + "]' aria-label='Default select example'><option value='-1' selected></option>@foreach ($tags as $key => $value)<option value=' {{ $value['id'] }} '>{{ $value['tag_name'] }}</option>@endforeach</select><br>";
                total.innerHTML = parseInt(cur_tag) + "/5";
            }
        }
    </script>
@endpush
