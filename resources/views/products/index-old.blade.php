@extends('layouts.app')
@section('title','Products')
@section('content')
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h3>Products</h3>
        <button class="btn btn-success" id="btn-create">Create Product</button>
    </div>

    {{--data-ajax="loadProducts"--}}

    <table id="product-table"
           class="table"
           data-toggle="table"

           data-ajax-options="ajaxOptions"
           data-url="{{ url('api/products') }}"

           data-side-pagination="server"
           data-pagination="true"

           data-page-list="[5, 10, 20, 50, 100, 200, All]"

           data-search="true"
           data-search-time-out="10"
           data-search-highlight="true"
           data-trim-on-search="false"

           data-buttons="buttons"
           data-buttons-class="primary"
           data-buttons-prefix="btn-sm btn"

           data-show-fullscreen="true"
           data-show-columns="true"
           data-show-columns-toggle-all="true"
           data-show-refresh="true"
           data-show-toggle="true"
    >
        <thead>
        <tr>
            <th data-field="id" data-sortable="true" data-visible="true" data-align="center" data-width="1">ID</th>
            <th data-field="name" data-sortable="true" data-visible="true" data-align="left" data-width="40">Name</th>
            <th data-field="description" data-sortable="true" data-visible="true" data-align="left" data-width="100">Description</th>
            <th data-field="price" data-sortable="true" data-visible="true" data-align="right" data-width="20"> Price</th>
            <th data-field="user_name" data-sortable="true" data-visible="true" data-align="left" data-width="20">Owner</th>
            <th data-field="actions" data-sortable="true" data-visible="true" data-align="center" data-width="10" data-formatter="productActions">Actions</th>
        </tr>
        </thead>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="productModal" tabindex="-1">
        <div class="modal-dialog">
            <form id="productForm" class="modal-content">
                <div class="modal-header"><h5 class="modal-title">Product</h5><button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button></div>
                <div class="modal-body">
                    <input type="hidden" id="product_id">
                    <div class="mb-2"><input id="name" class="form-control" placeholder="Name" required></div>
                    <div class="mb-2"><textarea id="description" class="form-control" rows="3" placeholder="Description"></textarea></div>
                    <div class="mb-2"><input id="price" class="form-control" placeholder="Price" required></div>
                    <div class="mb-2"><input id="image" type="file" class="form-control"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="saveProduct" class="btn btn-primary">Save</button>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('scripts')
    <script>
        const API_BASE = '/api';
        let token = null;

        $(function() {
            $.post('/api/login', {
                email: '{{ auth()->user()->email }}',
                password: ''
            }).fail(()=>{  });
        });

        const WEB_API_TOKEN = "{{ optional(auth()->user())->createToken('web-token')->plainTextToken ?? '' }}";
        token = WEB_API_TOKEN;

        let $table = $('#product-table');
        const ajaxOptions = {
            headers: {
                'Authorization': 'Bearer ' + token,
                'X-CSRF-TOKEN': '<?= csrf_token() ?>'
            }
        };

        function loadProducts() {
            $('#product-table').bootstrapTable('refresh');
        }

        function loadProducts_old() {
            $('#product-table').bootstrapTable('destroy').bootstrapTable({
                ajax: function(params){
                    $.ajax({
                        url: API_BASE + '/products',
                        headers: { Authorization: 'Bearer ' + token },
                        success: function(res){
                            const rows = res.data.map(p => ({
                                id:p.id,
                                name:p.name,
                                description:p.description,
                                price:p.price,
                                user_name: p.user?.name ?? ''
                            }));
                            params.success({ total: res.total, totalNotFiltered:res.total, rows });
                        },
                        error: function(xhr){ params.error(xhr); }
                    });
                },
                pagination: true,
                search: true,
            });
        }

        function productActions(value, row) {
            return `<button class="btn btn-sm btn-primary edit" data-id="${row.id}"><i class="fa fa-edit"></i></button>
          <button class="btn btn-sm btn-danger delete" data-id="${row.id}"><i class="fa fa-trash-o"></i></button>`;
        }
        window.productActions = productActions;

        $(document).ready(function(){

            $table.bootstrapTable();

            $('#table').on('post-body.bs.table', function () {
                $('.search input').addClass('form-control-sm');
            });

            // loadProducts();

            $('#btn-create').click(function(){
                $('#product_id').val('');
                $('#productForm')[0].reset();
                new bootstrap.Modal(document.getElementById('productModal')).show();
            });

            $('#saveProduct').click(function(e){
                e.preventDefault();
                const id = $('#product_id').val();
                const fd = new FormData();
                fd.append('name', $('#name').val());
                fd.append('description', $('#description').val());
                fd.append('price', $('#price').val());
                const f = $('#image')[0].files[0];
                if (f) fd.append('image', f);
                let url = API_BASE + '/products';

                if (id) { fd.append('_method','POST'); url = API_BASE + '/products/' + id; }

                $.ajax({
                    url, method: 'POST', data: fd, processData:false, contentType:false,
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(){ loadProducts(); bootstrap.Modal.getInstance(document.getElementById('productModal')).hide(); },
                    error: function(xhr){ alert(xhr.responseJSON?.message || 'Error'); }
                });
            });

            $(document).on('click', '.delete', function(){
                if(!confirm('Delete?')) return;
                const id = $(this).data('id');
                $.ajax({
                    url: API_BASE + '/products/' + id, method: 'DELETE',
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(){ loadProducts(); },
                    error: function(xhr){ alert(xhr.responseJSON?.message || 'Error'); }
                });
            });

            $(document).on('click', '.edit', function(){
                const id = $(this).data('id');
                $.ajax({
                    url: API_BASE + '/products/' + id,
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(p){
                        $('#product_id').val(p.id);
                        $('#name').val(p.name);
                        $('#description').val(p.description);
                        $('#price').val(p.price);
                        new bootstrap.Modal(document.getElementById('productModal')).show();
                    }, error: function(){ alert('Error'); }
                });
            });
        });
    </script>
@endpush
