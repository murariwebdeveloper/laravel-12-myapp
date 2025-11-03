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
            <th data-field="status_name" data-sortable="false" data-align="center">Status</th>
            <th data-field="actions" data-visible="true" data-align="center" data-formatter="rowActions">Actions</th>
        </tr>
        </thead>
    </table>


    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form id="editUserForm">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserLabel">Edit User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" id="editUserId">
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" id="editName" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" id="editEmail" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Status</label>
                            <select id="editStatus" class="form-select">
                                <option value="0">Registered</option>
                                <option value="1">Active</option>
                                <option value="2">Inactive</option>
                                <option value="3">Rejected</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                    </div>
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
                                status: u.status,
                                status_name: u.status == 1 ? 'Active' : (u.status == 2 ? 'Inactive' : (u.status == 3 ? 'Rejected' : 'Register' ))
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
            let button = `<button class="btn btn-sm btn-primary edit me-2" data-id="${row.id}"><i class="fa fa-edit"></i></button>
                <button class="btn btn-sm btn-danger delete me-2" data-id="${row.id}"><i class="fa fa-trash-o"></i></button>`;

            if(row.status == 0){
                button += `<button class="btn btn-sm btn-success me-2" onclick="changeStatus(${row.id}, 1)">Approve</button>
                    <button class="btn btn-sm btn-danger me-2" onclick="changeStatus(${row.id}, 3)">Reject</button>
                `;
            }

            if(row.status == 1){
                button += `<button class="btn btn-sm btn-warning me-2" onclick="changeStatus(${row.id}, 2)">Inactive</button>`;
            }

            if(row.status == 2){
                button += `<button class="btn btn-sm btn-success me-2" onclick="changeStatus(${row.id}, 1)">Active</button>`;
            }

            return button;
        }
        window.rowActions = rowActions;

        function changeStatus(id, status) {
            if(!confirm('Are you sure you want to Change Status?')) return;
            $.ajax({
                url: '/api/users/' + id + '/status',
                type: 'PATCH',
                headers: { 'Authorization': 'Bearer ' + token },
                data: { status: status },
                success: res => { alert(res.message); loadData(); },
                error: err => alert(err.responseJSON?.message ?? 'Error')
            });
        }

        $(document).ready(function(){
            loadData();

            $(document).on('click', '.delete', function(){
                if(!confirm('Are you sure you want to Delete?')) return;
                const id = $(this).data('id');
                $.ajax({
                    url: API_BASE + '/users/' + id,
                    type: 'DELETE',
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(res){ alert(res.message); loadData(); },
                    error: function(xhr){ alert(xhr.responseJSON?.message || 'Error'); }
                });
            });


            $(document).on('click', '.edit', function(){
                const id = $(this).data('id');
                $.ajax({
                    url: API_BASE + '/users/' + id,
                    headers: { Authorization: 'Bearer ' + token },
                    success: function(user){
                        $('#editUserId').val(user.id);
                        $('#editName').val(user.name);
                        $('#editEmail').val(user.email);
                        $('#editStatus').val(user.status);
                        const modal = new bootstrap.Modal(document.getElementById('editUserModal'));
                        modal.show();
                    },
                    error: function(){ alert('Error'); }
                });

            });

            $('#editUserForm').on('submit', function(e) {
                e.preventDefault();

                const id = $('#editUserId').val();
                const data = {
                    name: $('#editName').val(),
                    email: $('#editEmail').val(),
                    status: $('#editStatus').val(),
                };

                $.ajax({
                    url: '/api/users/' + id,
                    type: 'PUT',
                    headers: { 'Authorization': 'Bearer ' + token },
                    data: data,
                    success: res => {
                        alert(res.message);
                        $('#editUserModal').modal('hide');
                        loadData();
                    },
                    error: err => alert(err.responseJSON?.message ?? 'Error updating user')
                });
            });


        });

    </script>
@endpush
