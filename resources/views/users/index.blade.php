@extends('layouts.app')
@section('title','Users')
@section('content')
    <h3>Users</h3>
    <table id="user-table" class="table" data-toggle="table" data-pagination="true" data-search="true">
        <thead>
        <tr>
            <th data-field="id" data-sortable="true" data-align="center">ID</th>
            <th data-field="name" data-sortable="true" data-align="left">Name</th>
            <th data-field="email" data-sortable="true" data-align="left">Email</th>
            <th data-field="role" data-sortable="true" data-align="center">Role</th>
            <th data-field="status" data-sortable="true" data-align="center">Status</th>
            <th data-field="actions" data-sortable="true" data-visible="true" data-align="center" data-formatter="rowActions">Actions</th>
        </tr>
        </thead>
    </table>
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

        function loadData() {
            $('#user-table').bootstrapTable('destroy').bootstrapTable({

                ajax: function(params){
                    $.ajax({
                        url: API_BASE + '/users',
                        method: 'GET',
                        data: params.data,
                        headers: { Authorization: 'Bearer ' + token },
                        success: function(res){

                            const rows = res.data.map(u => ({
                                id: u.id,
                                name: u.name,
                                email: u.email,
                                role: u.role==1 ? 'Admin' : 'User',
                                status: u.status == 1 ? 'Active' : (u.status == 2 ? 'Inactive' : 'Register')
                            }));

                            params.success({ total: res.total, rows });
                        }
                    });
                },
                search: true,
                searchHighlight: true,
                showColumns: true,
                toolbar:".toolbar",
                buttons:"buttons",
                buttonsClass:"secondary",
                buttonsprefix:"btn btn-sm",

                showRefresh: true,
                showToggle: true,
                showFullscreen: true,
                mobileResponsive: true,
                showColumnsToggleAll: true,
                clickToSelect: true,

                showPaginationSwitch: true,
                pagination: true,
                idField: "id",
                pageList: "[5, 10, 20, 50, 100, 200, all]",
                pageSize: "10",
                showFooter: false,
                sidePagination: "server",
            });
        }

        function rowActions(value, row) {
            return `<button class="btn btn-sm btn-primary edit" data-id="${row.id}"><i class="fa fa-edit"></i></button>
                <button class="btn btn-sm btn-danger delete" data-id="${row.id}"><i class="fa fa-trash-o"></i></button>`;
        }
        window.rowActions = rowActions;

        $(document).ready(function(){
            loadData();

            $(document).on('click', '.delete', function(){
                if(!confirm('Delete?')) return;
                const id = $(this).data('id');
                $.ajax({
                    url: API_BASE + '/users/' + id,
                    method: 'DELETE',
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(){ loadData(); },
                    error: function(xhr){ alert(xhr.responseJSON?.message || 'Error'); }
                });
            });
        });

    </script>
@endpush
