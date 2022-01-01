@extends('bakery.layout.master')

@section('content')
	<div class="container my-3">
		<div class="row">
			<div class="col-md-3 col-lg-3 col-xl-3 col-sm-12">
				<form method="POST" action="{{ route('search_store') }}">
					@csrf
					<div style="display: inline-flex; border-radius: 40px; background-color: none; padding: 2px; border: 1px solid lightgray; width: 100%;">
						<input 
							value="{{ $param['search'] }}" 
							type="text" name="search" style="outline: none; border: none; background-color: transparent; padding: 10px; height: 40px; width: 100%;">
						<button name="submit" class="btn btn-warning" style="border-radius: 40px; height: 40px;">Search</button>
					</div><br>
					Search by :
					<select name="type" aria-label="Default select example">
						<option value="book_name" selected>Book name</option>
						<option value="author">Author name</option>
					</select><br>
					Bookstores :
					<select name="bookstore" aria-label="Default select example">
						<option value="-1" selected></option>
						@foreach ($bookstores as $key => $value)
							<option value="{{ $value['id'] }}">{{ $value['bookstore_name'] }}</option>
						@endforeach
					</select><br>
					<div class="form-group">
						<label>
							Tags :
							<a href="#/" onclick="add_tag()"><i class="fas fa-plus"></i></a>
						</label>
						<h6 id="total">1/5</h6>
						<select class="form-select" name="tags[1]" aria-label="Default select example">
							<option value="-1" selected></option>
							@foreach ($tags as $key => $value)
								<option value=" {{ $value['id'] }} ">{{ $value['tag_name'] }}</option>
							@endforeach
						</select>
						<div id="extra_tags">
							
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-9 col-lg-9 col-xl-9 col-sm-12">
				<h1 style="width: 100%;" class="border-bottom">
					@if ($param['search'] != '')
						Results for "{{ $param['search'] }}"
					@endif
				</h1>
				<div class="d-flex" style="flex-flow: row wrap;">
					@foreach ($books as $key => $value)
						<div class="single-book px-2" style="width: 30%;">
							<a href="{{ route('book_details' , $value['id']) }}" class="single-book__img">
								<img src="{{ asset($value['image']) }}" style="width: 100%;" alt="single book and cd">
								<div class="single-book_download">
									<img src="./bakery/img/svg/download.svg" alt="book image">
								</div>
							</a>
							<h4 class="single-book__title my-1"><a href="{{ route('book_details' , $value['id']) }}">{{ $value['book_name'] }}</a></h4>
							<h6 class="text-secondary my-1">{{ $value['author'] }}</h6>
							<h6 class="text-secondary my-1">{{ $value['bookstore_name'] }}</h6>
							<span class="single-book__price my-1">${{ $value['price'] }}</span>
							<!-- star rating -->
							<div class="rating">
								@for ($i=0 ; $i < 5-$value['stars'] ; $i++)
									<span>&#9734;</span>
								@endfor
								@for ($i=0 ; $i < $value['stars'] ; $i++)
									<span>&#9733;</span>
								@endfor
							</div>
							<!-- star rating end -->
						</div>
					@endforeach
				</div>
			</div>
		</div>
	</div>
@endsection

@section('title')
	Category
@endsection

@push ('scripts')
    <script type="text/javascript">
        var tags = document.getElementById('extra_tags');
        var total = document.getElementById('total');
        var cur_tag = 1;

        function add_tag () {
            if (cur_tag < 5) {
                cur_tag += 1;
                tags.innerHTML += "<br><select class='form-select' name='tags[" + parseInt(cur_tag) + "]' aria-label='Default select example'><option value='-1' selected></option>@foreach ($tags as $key => $value)<option value=' {{ $value['id'] }} '>{{ $value['tag_name'] }}</option>@endforeach</select><br>";
                total.innerHTML = parseInt(cur_tag) + "/5";
            }
        }
    </script>
@endpush
